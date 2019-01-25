part of twitter;

class HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  final LocalStorage storage = LocalStorage('@twitterclone');
  TabController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    controller = TabController(vsync: this, initialIndex: 0, length: 4);
    controller.addListener(() => setState(() {}));
    super.initState();
  }

  void incrementCounter() {
    Application.router.navigateTo(context, Routes.newTweet);
  }

  String get titleText {
    switch (controller.index) {
      case 0:
        return 'Inicio';
      case 1:
        return 'Buscar en Twitter';
      case 2:
        return 'Notificaciones';
      case 3:
        return 'Mensajes';
      default:
        return 'Twitter';
    }
  }

  Widget get renderTitle {
    Size size = MediaQuery.of(context).size;
    return Query(me, builder: ({
      bool loading,
      Map data,
      Exception error,
    }) {
      var user = data['me'];
      switch (controller.index) {
        case 0:
        case 2:
        case 3:
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 24.0),
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: TwitterColor.cerulean,
                  borderRadius: BorderRadius.circular(16.0),
                  image: user != null
                      ? DecorationImage(
                          image: NetworkImage(user['avatar']),
                        )
                      : null,
                ),
              ),
              Text(titleText)
            ],
          );
        case 1:
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 24.0),
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: TwitterColor.cerulean,
                  borderRadius: BorderRadius.circular(16.0),
                  image: user != null
                      ? DecorationImage(
                          image: NetworkImage(user['avatar']),
                        )
                      : null,
                ),
              ),
              InkWell(
                onTap: () => print('a buscar bebe'),
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: size.width * 0.6,
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                      color: TwitterColor.mystic,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Text(
                    titleText,
                    style: TextStyle(
                      color: TwitterColor.paleSky,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          );
        default:
          return Container();
      }
    });
  }

  List<Widget> get renderActions {
    switch (controller.index) {
      case 1:
        return [
          IconButton(
            onPressed: () => print('añadiendo'),
            icon: Icon(
              TwitterIcons.add_account_outline,
              color: TwitterColor.cerulean,
            ),
          ),
        ];
      case 2:
      case 3:
        return [
          IconButton(
            onPressed: () => print('settings'),
            icon: Icon(
              TwitterIcons.setting_outline,
              color: TwitterColor.cerulean,
            ),
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColor.mystic,
      appBar: AppBar(
        backgroundColor: TwitterColor.white,
        brightness: Brightness.light,
        centerTitle: false,
        title: renderTitle,
        actions: renderActions,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: TwitterColor.white,
          border: Border(
            top: BorderSide(
              color: TwitterColor.paleSky50,
            ),
          ),
        ),
        child: TabBar(
          indicatorWeight: 0.1,
          labelColor: TwitterColor.dodgetBlue,
          unselectedLabelColor: TwitterColor.paleSky,
          controller: controller,
          indicatorColor: TwitterColor.cerulean,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                controller.index == 0
                    ? TwitterIcons.home_filled
                    : TwitterIcons.home_outline,
              ),
            ),
            Tab(
              icon: Icon(
                controller.index == 1
                    ? TwitterIcons.search_filled
                    : TwitterIcons.search_outline,
              ),
            ),
            Tab(
              icon: Icon(
                controller.index == 2
                    ? TwitterIcons.notification_filled
                    : TwitterIcons.notification_outline,
              ),
            ),
            Tab(
              icon: Icon(
                controller.index == 3
                    ? TwitterIcons.message_filled
                    : TwitterIcons.message_outline,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[Home(), Search(), Notification(), Message()],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TwitterColor.dodgetBlue,
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: Icon(TwitterIcons.new_tweet_filled),
      ),
    );
  }
}
