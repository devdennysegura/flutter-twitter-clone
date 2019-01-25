part of twitter;

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  ScrollController controller = ScrollController(
    keepScrollOffset: true,
    initialScrollOffset: 0.0,
  );
  List<dynamic> tweets = List();
  List<dynamic> recents = List();
  SocketClient socketClient;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    SocketClient.connect(graphQlWS).then((ws) {
      socketClient = ws;
      socketClient
          .subscribe(SubscriptionRequest(tweetAddOperation, addTweetEvent, {}))
          .listen(subscriptionListener);
    });
    super.initState();
  }

  void subscriptionListener(subscription) {
    if (subscription.type == 'data') recents.add(subscription.data['tweetAdded']);
  }

  void showMore() {
    setState(() {
      tweets.insertAll(0, recents);
      recents.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Query(readTweets, builder: ({
      bool loading,
      Map data,
      Exception error,
    }) {
      if (data['tweets'] != null && tweets.length < data['tweets'].length)
        tweets.addAll(data['tweets']);
      return LayoutBuilder(
        builder: (context, constraint) {
          return Container(
            width: constraint.maxWidth,
            height: constraint.maxHeight,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  (recents.length > 0
                      ? InkWell(
                          onTap: showMore,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            color: TwitterColor.white,
                            child: Center(
                              child: Text(
                                Wording.showMore,
                                style: TextStyle(
                                  color: TwitterColor.dodgetBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container()),
                  Container(
                    height: constraint.maxHeight -
                        (recents.length > 0 ? 34.0 : 0.0),
                    width: constraint.maxWidth,
                    child: ConstrainedBox(
                      constraints: constraint,
                      child: ListView.builder(
                        padding: EdgeInsets.all(0.0),
                        addAutomaticKeepAlives: true,
                        itemCount: tweets.length,
                        itemBuilder: (context, int index) {
                          return FeedCard(tweet: tweets[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
