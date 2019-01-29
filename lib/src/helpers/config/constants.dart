part of twitter;

const bool inProduction = const bool.fromEnvironment('dart.vm.product');
const host = '2f10888c.ngrok.io';
const String graphQlApi = 'https://$host/graphql';
const String graphQlWS = 'ws://$host/subscriptions';
const String fakeAvatar = 'https://i.imgur.com/aYd1p1J.png';
const String fakeAvatar1 = 'https://i.imgur.com/BS3sULw.png';
Client emptyClient = Client(
  endPoint: graphQlApi,
  cache: InMemoryCache(),
  apiToken: null,
);
