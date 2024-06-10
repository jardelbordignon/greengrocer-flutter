String authErrors(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Invalid credentials';
    case 'Invalid session token':
      return 'Invalid session token';
    default:
      return 'A undefined error occurred';
  }
}
