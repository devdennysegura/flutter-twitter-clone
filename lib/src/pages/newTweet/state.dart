part of twitter;

class NewTweetState extends State<NewTweet> {
  final TextEditingController tweetController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  void addTweet(runMutation) {
    if (tweetController.text != null && tweetController.text.isNotEmpty)
      runMutation({'text': tweetController.text});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TwitterColor.mystic,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: TwitterColor.white,
        brightness: Brightness.light,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Application.router.pop(context),
          color: TwitterColor.dodgetBlue,
          icon: Icon(Icons.close),
        ),
        actions: <Widget>[
          Mutation(createTweetMutation, builder: (
            runMutation, {
            bool loading,
            var data,
            Exception error,
          }) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                color: TwitterColor.dodgetBlue,
                onPressed: () => addTweet(runMutation),
                child: Text(
                  Wording.twittear,
                  style: TextStyle(
                    color: TwitterColor.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }, onCompleted: (Map<String, dynamic> data) {
            Application.router.pop(context);
          }),
        ],
      ),
      bottomNavigationBar: Container(
        height: 56.0,
        width: size.width,
        decoration: BoxDecoration(
          color: TwitterColor.white,
          border: Border(
            top: BorderSide(
              color: TwitterColor.paleSky50,
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Container(
            height: constraint.maxHeight,
            width: constraint.maxWidth,
            color: TwitterColor.mystic,
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Query(me, builder: ({
                  bool loading,
                  Map data,
                  Exception error,
                }) {
                  var user = data['me'];
                  return Container(
                    width: 40.0,
                    height: 40.0,
                    margin: EdgeInsets.only(right: 24.0),
                    decoration: BoxDecoration(
                      color: TwitterColor.cerulean,
                      borderRadius: BorderRadius.circular(20.0),
                      image: user != null
                          ? DecorationImage(
                              image: NetworkImage(user['avatar']),
                            )
                          : null,
                    ),
                  );
                }),
                Container(
                  width: 250.0,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: tweetController,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.0,
                          color: Colors.transparent,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(0.0),
                      labelText: Wording.addComment,
                      labelStyle: TextStyle(
                        color: TwitterColor.woodsmoke,
                      ),
                    ),
                    autocorrect: false,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
