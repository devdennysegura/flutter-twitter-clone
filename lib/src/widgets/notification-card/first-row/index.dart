part of twitter;

class FirstRowNotificationCard extends StatelessWidget {
  final String avatar;

  FirstRowNotificationCard({this.avatar, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.star,
            size: 32.0,
            color: TwitterColor.dodgetBlue,
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0),
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: TwitterColor.dodgetBlue,
              borderRadius: BorderRadius.circular(24.0),
              image: avatar != null
                  ? DecorationImage(
                      image: NetworkImage(avatar),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
