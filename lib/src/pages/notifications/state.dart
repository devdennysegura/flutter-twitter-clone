part of twitter;

class NotificationState extends State<Notification>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = TabController(vsync: this, initialIndex: 0, length: 2);
    controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        color: TwitterColor.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 56.0,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: TwitterColor.mystic,
                  ),
                ),
              ),
              child: TabBar(
                indicatorColor: TwitterColor.dodgetBlue,
                indicatorWeight: 3.0,
                controller: controller,
                unselectedLabelColor: TwitterColor.woodsmoke_50,
                labelColor: TwitterColor.dodgetBlue,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                tabs: <Widget>[
                  Tab(text: 'Todas'),
                  Tab(text: 'Menciones'),
                ],
              ),
            ),
            Container(
              height: constraints.maxHeight - 56.0,
              width: constraints.maxWidth,
              child: TabBarView(
                controller: controller,
                children: <Widget>[
                  AllNotification(),
                  NotificationMention(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
