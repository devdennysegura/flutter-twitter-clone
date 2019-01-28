part of twitter;

class SecondRowNotificationCard extends StatelessWidget {
  final String name;
  final String comment;

  SecondRowNotificationCard({this.name, this.comment, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 32.0, right: 24.0),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                text: Wording.recentTweet,
                style: TextStyle(
                  color: TwitterColor.woodsmoke,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            comment,
            style: TextStyle(
              color: TwitterColor.woodsmoke_50,
            ),
          ),
        ],
      ),
    );
  }
}
