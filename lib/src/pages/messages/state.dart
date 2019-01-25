part of twitter;

class MessageState extends State<Message> with SingleTickerProviderStateMixin {
  ScrollController controller = ScrollController(
    keepScrollOffset: true,
    initialScrollOffset: 0.0,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ConstrainedBox(
        constraints: constraint,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: constraint.maxWidth,
              height: constraint.maxHeight * 0.6,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: TwitterColor.dodgetBlue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      margin: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        Wording.messageIntro,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: TwitterColor.white,
                        ),
                      ),
                    ),
                    FlatButton(
                      color: TwitterColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      onPressed: () => print('Encuentra amigos'),
                      child: Text(
                        Wording.findYourFriends,
                        style: TextStyle(
                          color: TwitterColor.dodgetBlue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
