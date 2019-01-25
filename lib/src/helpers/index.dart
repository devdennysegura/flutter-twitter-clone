part of twitter;

bool isEmail(String email) {
  Pattern emailPattern =
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  RegExp regex = RegExp(emailPattern);
  return email != null && email.isNotEmpty && regex.hasMatch(email);
}

void showMessage(GlobalKey<ScaffoldState> key, String message) {
  key.currentState.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
