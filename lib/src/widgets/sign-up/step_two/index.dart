part of twitter;

class SignUpStepTwoForm extends StatefulWidget {
  final TextEditingController pass;

  SignUpStepTwoForm({
    @required this.pass,
    Key key,
  }) : super(key: key);

  _SignUpStepTwoFormState createState() => _SignUpStepTwoFormState();
}

class _SignUpStepTwoFormState extends State<SignUpStepTwoForm> {
  bool isVisible = false;

  void showPassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12.0),
              child: Text(
                Wording.newPass,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4.0, bottom: 24.0),
              child: Text(
                Wording.passSuggestion,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              child: TextField(
                controller: widget.pass,
                keyboardType: TextInputType.text,
                maxLines: 1,
                obscureText: !isVisible,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: TwitterColor.cerulean,
                    ),
                  ),
                  suffix: InkWell(
                    splashColor: Colors.transparent,
                    onTap: showPassword,
                    child: Icon(
                      TwitterIcons.eye_outline,
                      color:
                          isVisible ? TwitterColor.dodgetBlue : TwitterColor.mystic,
                    ),
                  ),
                  labelText: Wording.pass,
                  labelStyle: TextStyle(
                    color: TwitterColor.woodsmoke,
                  ),
                ),
                autocorrect: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
