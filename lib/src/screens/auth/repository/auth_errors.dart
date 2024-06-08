String authErrors(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Invalid credentials';
    default:
      return 'A undefined error occurred';
  }
}
