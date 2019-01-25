part of twitter;

class FeedCard extends StatelessWidget {
  final dynamic tweet;

  FeedCard({@required this.tweet, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: TwitterColor.white,
        border: Border(
          bottom: BorderSide(
            color: TwitterColor.paleSky50,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FeedCardAvatar(url: tweet['user']['avatar']),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 254.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FeedCardOwner(
                      name:
                          '${tweet['user']['firstName']} ${tweet['user']['lastName'] ?? ''} ',
                      nickname: '${tweet['user']['username']}',
                      time: ' ${timeago.format(DateTime.parse(tweet['createdAt']), locale: 'en_short')}',
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: TwitterColor.paleSky,
                    )
                  ],
                ),
              ),
              Container(
                width: 254.0,
                child: Text(tweet['text']),
              ),
              Container(
                width: 230.0,
                margin: EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FeedCardAction(
                      icon: TwitterIcons.comment_outline,
                      value: '',
                    ),
                    FeedCardAction(
                      icon: TwitterIcons.retweet_outline,
                      value: '',
                    ),
                    FeedCardAction(
                      icon: TwitterIcons.heart_outline,
                      value:
                          '${tweet['favoriteCount'] > 0 ? tweet['favoriteCount'] : ''}',
                    ),
                    FeedCardAction(
                      icon: TwitterIcons.comment_outline,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
