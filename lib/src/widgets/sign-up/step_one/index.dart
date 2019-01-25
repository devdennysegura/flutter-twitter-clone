part of twitter;

class SignUpStepOneForm extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController email;

  SignUpStepOneForm({
    @required this.name,
    @required this.email,
    Key key,
  }) : super(key: key);

  _SignUpStepOneFormState createState() => _SignUpStepOneFormState();
}

class _SignUpStepOneFormState extends State<SignUpStepOneForm> {
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12.0, bottom: 64.0),
              child: Text(
                Wording.newAccount,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                onChanged: refresh,
                controller: widget.name,
                keyboardType: TextInputType.text,
                maxLines: 1,
                maxLength: 50,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: TwitterColor.cerulean,
                    ),
                  ),
                  labelText: Wording.name,
                  labelStyle: TextStyle(
                    color: TwitterColor.woodsmoke,
                  ),
                  suffixIcon: widget.name.text.isNotEmpty &&
                          widget.name.text.length >= 6
                      ? Icon(
                          TwitterIcons.circle_check_outline,
                          color: Colors.green,
                        )
                      : null,
                ),
                autocorrect: false,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                onChanged: refresh,
                keyboardType: TextInputType.emailAddress,
                controller: widget.email,
                maxLines: 1,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.0, color: TwitterColor.cerulean),
                  ),
                  labelText: Wording.email,
                  labelStyle: TextStyle(
                    color: TwitterColor.woodsmoke,
                  ),
                  suffixIcon: isEmail(widget.email.text)
                      ? Icon(
                          TwitterIcons.circle_check_outline,
                          color: Colors.green,
                        )
                      : null,
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
