part of twitter;

String favoriteTweetMutation = '''
  mutation favoriteTweet(\$_id: ID!) {
    favoriteTweet(_id: \$_id) {
      isFavorited
      favoriteCount
      _id
    }
  }
'''
    .replaceAll('\n', ' ');