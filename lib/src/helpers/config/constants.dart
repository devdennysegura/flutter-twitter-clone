part of twitter;

const bool inProduction = const bool.fromEnvironment('dart.vm.product');
const String graphQlApi = 'https://1872c28f.ngrok.io/graphql';
const String graphQlWS = 'ws://1872c28f.ngrok.io/subscriptions';
const String fakeAvatar = 'https://i.imgur.com/aYd1p1J.png';
Client emptyClient = Client(
  endPoint: graphQlApi,
  cache: InMemoryCache(),
  apiToken: null,
);
