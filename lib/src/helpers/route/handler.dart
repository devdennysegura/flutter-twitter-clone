part of twitter;

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Container();
});
var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SignIn();
});
var signupHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SignUp();
});
var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeTab();
});
var newTweetHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NewTweet();
});
