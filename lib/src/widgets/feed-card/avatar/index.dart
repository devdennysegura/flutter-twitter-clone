part of twitter;

class FeedCardAvatar extends StatelessWidget {
  final String url;

  FeedCardAvatar({@required this.url, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      width: twAvatar['width'],
      height: twAvatar['height'],
      decoration: BoxDecoration(
        color: TwitterColor.dodgetBlue,
        borderRadius: BorderRadius.circular(
          twAvatar['radius'],
        ),
        image: url != null
            ? DecorationImage(
                image: NetworkImage(url),
              )
            : null,
      ),
    );
  }
}
