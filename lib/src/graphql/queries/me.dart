part of twitter;

String me = '''
  query readMe {
     me {
      avatar
      username
      firstName
      lastName
    }
  }
'''
    .replaceAll('\n', ' ');
