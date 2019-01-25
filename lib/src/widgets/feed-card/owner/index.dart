part of twitter;

class FeedCardOwner extends StatelessWidget {
  final String name;
  final String nickname;
  final String time;

  FeedCardOwner(
      {@required this.name,
      @required this.nickname,
      @required this.time,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$name ',
        style: TextStyle(
          color: TwitterColor.woodsmoke,
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '@$nickname ·',
            style: TextStyle(
              color: TwitterColor.paleSky,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: ' $time',
            style: TextStyle(
              color: TwitterColor.paleSky,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
