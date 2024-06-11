String authErrors(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Invalid credentials';
    case 'Invalid session token':
      return 'Invalid session token';

    case 'INVALID_FULLNAME':
      return 'Invalid name';
    case 'INVALID_PHONE':
      return 'Invalid phone';
    case 'INVALID_CPF':
      return 'Invalid CPF';
    default:
      return 'A undefined error occurred';
  }
}
