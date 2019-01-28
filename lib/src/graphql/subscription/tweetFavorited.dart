part of twitter;

String tweetFavoritedOperation = 'tweetFavorited';
String tweetFavoritedEvent = '''
  subscription $tweetFavoritedOperation {
    tweetFavorited {
      _id
      favoriteCount
    }
  }
'''
    .replaceAll('\n', ' ');
