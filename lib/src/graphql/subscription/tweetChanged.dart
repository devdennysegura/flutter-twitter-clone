part of twitter;

String tweetchangedOperation = 'tweetChanged';
String tweetchangedEvent = '''
  subscription tweetChanged {
    tweetChanged {
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
