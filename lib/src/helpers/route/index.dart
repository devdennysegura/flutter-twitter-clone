part of twitter;

class Application {
  static Router router;
}

class Routes {
  static String root = '/';
  static String login = '/log-in';
  static String signup = '/sign-up';
  static String home = '/home';
  static String newTweet = '/new-tweet';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ROUTE WAS NOT FOUND !!!');
    });
    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(signup,
        handler: signupHandler, transitionType: TransitionType.inFromRight);
    router.define(home,
        handler: homeHandler, transitionType: TransitionType.inFromBottom);
    router.define(newTweet,
        handler: newTweetHandler, transitionType: TransitionType.inFromBottom);
  }
}
