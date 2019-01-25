part of twitter;

class SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final LocalStorage storage = LocalStorage('@twitterclone');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passController?.dispose();
    super.dispose();
  }

  void signIn() {}

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: TwitterColor.white,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: TwitterColor.white,
        brightness: Brightness.light,
        centerTitle: false,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton(
            textColor: TwitterColor.dodgetBlue,
            onPressed: () => Application.router.navigateTo(
                  context,
                  Routes.signup,
                ),
            child: Text(Wording.register),
          ),
          IconButton(
            color: TwitterColor.dodgetBlue,
            icon: Icon(TwitterIcons.vertical_dot_outline),
            onPressed: () => print('algo'),
          )
        ],
        title: LayoutBuilder(builder: (context, constraint) {
          return Container(
            width: constraint.maxWidth,
            height: constraint.maxHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  TwitterIcons.twitter_filled,
                  color: TwitterColor.dodgetBlue,
                ),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(right: 16.0),
        width: size.width,
        height: 56.0,
        decoration: BoxDecoration(
          color: TwitterColor.white,
          border: Border(
            top: BorderSide(
              color: TwitterColor.paleSky50,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              disabledColor: TwitterColor.dodgetBlue_50,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              color: TwitterColor.dodgetBlue,
              onPressed: signIn,
              child: Text(
                Wording.signin,
                style: TextStyle(
                  color: TwitterColor.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return Container(
          width: constraint.maxWidth,
          height: constraint.maxHeight,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Container(
              width: constraint.maxWidth,
              height: constraint.maxHeight,
              child: Column(
                children: <Widget>[
                  SignInForm(
                    email: emailController,
                    pass: passController,
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
