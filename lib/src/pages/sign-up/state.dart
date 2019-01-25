part of twitter;

class SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TabController controller;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final LocalStorage storage = LocalStorage('@twitterclone');

  @override
  void initState() {
    controller = TabController(vsync: this, initialIndex: 0, length: 2);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    nameController?.dispose();
    emailController?.dispose();
    passController?.dispose();
    super.dispose();
  }

  void signup(runMutation) {
    if (controller.index == 0) {
      if (nameController.text == null ||
          nameController.text.isEmpty ||
          nameController.text.length < 6 ||
          !isEmail(emailController.text)) {
        return;
      } else {
        controller.animateTo(1);
      }
    } else {
      if (passController.text == null ||
          passController.text.isEmpty ||
          passController.text.length < 6) {
        return;
      } else {
        runMutation({
          'fullName': nameController.text,
          'email': emailController.text,
          'password': passController.text,
          'username': nameController.text.split(' ')[0].toLowerCase(),
          'avatar': fakeAvatar
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: TwitterColor.white,
      appBar: AppBar(
        backgroundColor: TwitterColor.white,
        brightness: Brightness.light,
        centerTitle: false,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Application.router.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: TwitterColor.dodgetBlue,
          ),
        ),
        title: LayoutBuilder(builder: (context, constraint) {
          return Container(
            width: constraint.maxWidth - 24.0,
            height: constraint.maxHeight,
            child: Center(
              child: Icon(
                TwitterIcons.twitter_filled,
                color: TwitterColor.dodgetBlue,
              ),
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
            Mutation(signUpMutation, builder: (
              runMutation, {
              bool loading,
              var data,
              Exception error,
            }) {
              // if (error != null && controller.index == 1)
              // print('error $error');
              // showMessage(
              //     scaffoldKey, 'oops tuvimos un error, vuelve a intentarlo');
              return RaisedButton(
                disabledColor: TwitterColor.dodgetBlue_50,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                color: TwitterColor.dodgetBlue,
                onPressed: loading ? null : () => signup(runMutation),
                child: Text(
                  controller.index == 1 ? Wording.signin : Wording.next,
                  style: TextStyle(
                    color: TwitterColor.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }, onCompleted: (Map<String, dynamic> data) {
              storage.setItem('auth', data['signup']['token']);
              ValueNotifier<Client> client = ValueNotifier(emptyClient);
              client.value.apiToken = data['signup']['token'];
              Application.router.navigateTo(context, Routes.home,
                  replace: true, clearStack: true);
            }),
          ],
        ),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return Container(
          width: constraint.maxWidth,
          height: constraint.maxHeight,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: constraint.maxWidth,
            height: constraint.maxHeight,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: <Widget>[
                SignUpStepOneForm(
                  name: nameController,
                  email: emailController,
                ),
                SignUpStepTwoForm(
                  pass: passController,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
