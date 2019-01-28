part of twitter;

class FeedNotificationCard extends StatelessWidget {
  final dynamic notification;

  FeedNotificationCard({this.notification, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.only(left: 48.0, bottom: 8.0, top: 8.0),
      decoration: BoxDecoration(
        color: TwitterColor.white,
        border: Border(
          bottom: BorderSide(
            color: TwitterColor.paleSky50,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FirstRowNotificationCard(
            avatar: notification['avatar'],
          ),
          SecondRowNotificationCard(
            name: notification['name'],
            comment: notification['message'],
          )
        ],
      ),
    );
  }
}
