library twitter;

// Dart import
import 'package:timeago/timeago.dart' as timeago;

import 'package:flutter/material.dart';

// Plugins
import 'package:meta/meta.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:fluro/fluro.dart';

// Theming
part 'theme/color.dart';
part 'theme/icons.dart';
part 'theme/style.dart';
part 'theme/wording.dart';

// GraphQl
part 'graphql/mutations/sign-in.dart';
part 'graphql/mutations/sign-up.dart';
part 'graphql/mutations/create-tweet.dart';
part 'graphql/mutations/favorite-tweet.dart';
part 'graphql/subscription/tweetAdd.dart';
part 'graphql/subscription/tweetFavorited.dart';
part 'graphql/subscription/tweetChanged.dart';
part 'graphql/queries/tweets.dart';
part 'graphql/queries/me.dart';

// Helpers
part 'helpers/index.dart';
part 'helpers/config/constants.dart';

// Router
part 'helpers/route/index.dart';
part 'helpers/route/handler.dart';

// Widget
part 'widgets/notification-card/first-row/index.dart';
part 'widgets/notification-card/second-row/index.dart';
part 'widgets/notification-card/item/index.dart';
part 'widgets/feed-card/item/index.dart';
part 'widgets/feed-card/action/index.dart';
part 'widgets/feed-card/avatar/index.dart';
part 'widgets/feed-card/owner/index.dart';
part 'widgets/sign-up/step_one/index.dart';
part 'widgets/sign-up/step_two/index.dart';
part 'widgets/sign-in/index.dart';

// Pages
part 'pages/root/index.dart';
part 'pages/root/state.dart';
part 'pages/sign-in/index.dart';
part 'pages/sign-in/state.dart';
part 'pages/sign-up/index.dart';
part 'pages/sign-up/state.dart';
part 'pages/home_tabs/index.dart';
part 'pages/home_tabs/state.dart';
part 'pages/newTweet/index.dart';
part 'pages/newTweet/state.dart';
part 'pages/home/index.dart';
part 'pages/home/state.dart';
part 'pages/messages/index.dart';
part 'pages/messages/state.dart';
part 'pages/notifications/index.dart';
part 'pages/notifications/state.dart';
part 'pages/notifications-mentions/index.dart';
part 'pages/notifications-mentions/state.dart';
part 'pages/notifications-all/index.dart';
part 'pages/notifications-all/state.dart';
part 'pages/search/index.dart';
part 'pages/search/state.dart';

class Twitter extends StatelessWidget {

  Twitter() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Client> client = ValueNotifier(emptyClient);
    return GraphqlProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: !inProduction,
          title: 'Twitter',
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'GoogleSans',
            primaryColor: TwitterColor.white,
          ),
          onGenerateRoute: Application.router.generator,
        ),
      ),
    );
  }
}
