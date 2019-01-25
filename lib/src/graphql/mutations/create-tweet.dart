part of twitter;

String createTweetMutation = '''
  mutation createTweet(\$text: String!) {
    createTweet(text: \$text) {
      text
      _id
      createdAt
      favoriteCount
    }
  }
'''
    .replaceAll('\n', ' ');
