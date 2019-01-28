part of twitter;

class NotificationMentionState extends State<NotificationMention> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        color: TwitterColor.mystic,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  Wording.nothingHere,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TwitterColor.woodsmoke,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                )),
            Text(
              Wording.mentionedTweetsEmpty,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: TwitterColor.woodsmoke_50,
              ),
            )
          ],
        ),
      );
    });
  }
}
