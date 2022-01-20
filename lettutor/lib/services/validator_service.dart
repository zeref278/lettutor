class ValidatorService {
  static bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email) &&
        email != '';
  }

  static bool validatePassword(String password) {
    return password != '';
  }

  static bool validateConfirmPassword(String password, String newPassword) {
    return password == newPassword && password != '';
  }
}
