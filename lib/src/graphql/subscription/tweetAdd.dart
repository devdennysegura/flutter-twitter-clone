part of twitter;

String tweetAddOperation = 'tweetAdded';
String addTweetEvent = '''
  subscription $tweetAddOperation {
    tweetAdded {
      text
      _id
      createdAt
      favoriteCount
      user {
        username
        avatar
        lastName
        firstName
      }
    }
  }
'''
    .replaceAll('\n', ' ');
