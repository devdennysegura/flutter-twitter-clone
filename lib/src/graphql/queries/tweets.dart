part of twitter;

String readTweets = '''
  query readTweets {
    tweets: getTweets {
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
