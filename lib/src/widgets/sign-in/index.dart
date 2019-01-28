part of twitter;

class SignInForm extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController pass;

  SignInForm({
    @required this.email,
    @required this.pass,
    Key key,
  }) : super(key: key);

  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void refresh(e) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 12.0,
              bottom: 24.0,
            ),
            child: Text(
              Wording.signInTitle,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: TextField(
              onChanged: refresh,
              controller: widget.email,
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: TwitterColor.dodgetBlue,
                  ),
                ),
                labelText: Wording.signInUsername,
                labelStyle: TextStyle(
                  color: TwitterColor.woodsmoke,
                ),
              ),
              autocorrect: false,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: TextField(
              onChanged: refresh,
              keyboardType: TextInputType.text,
              controller: widget.pass,
              maxLines: 1,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: TwitterColor.dodgetBlue,
                  ),
                ),
                labelText: Wording.email,
                labelStyle: TextStyle(
                  color: TwitterColor.woodsmoke,
                ),
              ),
              autocorrect: false,
            ),
          ),
        ],
      ),
    );
  }
}
