part of twitter;

class RootState extends State<Root> {
  final LocalStorage storage = LocalStorage('@twitterclone');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    storage.ready.then((e) {
      String token = storage.getItem('auth');
      if (token != null) {
        ValueNotifier<Client> client = ValueNotifier(emptyClient);
        String token = storage.getItem('auth');
        client.value.apiToken = token;
        Application.router
            .navigateTo(context, Routes.home, clearStack: true, replace: true);
      } else {
        Application.router
            .navigateTo(context, Routes.login, clearStack: true, replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TwitterColor.dodgetBlue,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              TwitterIcons.twitter_filled,
              color: TwitterColor.white,
              size: 64.0,
            )
          ],
        ),
      ),
    );
  }
}
