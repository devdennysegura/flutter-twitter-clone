part of twitter;

String signInMutation = '''
  mutation login(\$email: String!, \$password: String!) {
    login(email: \$email, password: \$password) {
      token
    }
  }
'''
    .replaceAll('\n', ' ');