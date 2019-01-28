part of twitter;

String me = '''
  query readMe {
     me {
      _id
      avatar
      username
      firstName
      lastName
    }
  }
'''
    .replaceAll('\n', ' ');
