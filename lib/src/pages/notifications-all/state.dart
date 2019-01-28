part of twitter;

class AllNotificationState extends State<AllNotification> {
  final dynamic mockNotification = {
    'avatar': fakeAvatar1,
    'name': 'Noruego',
    'message':
        'v2.22 added clickable links to stack traces in the Debug Console 🎉🍾',
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        color: TwitterColor.mystic,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FeedNotificationCard(
              notification: mockNotification,
            )
          ],
        ),
      );
    });
  }
}
