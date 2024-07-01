class Validator {
  // Check if the email is valid
  static bool isEmailValid(String email) {
    final emailRegex = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegex.hasMatch(email);
  }

  // Check if the password is valid
  // For example, a valid password must be at least 8 characters long and include one uppercase letter, one lowercase letter, one digit, and one special character
  static bool isPasswordValid(String password) {
    final passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$',
      caseSensitive: true,
      multiLine: false,
    );
    return passwordRegex.hasMatch(password);
  }

  // Check if the phone number is valid
  // This regex is for a generic international phone number validation
  static bool isPhoneNumberValid(String phoneNumber) {
    final phoneRegex = RegExp(
      r'^\+?[1-9]\d{1,14}$',
      caseSensitive: false,
      multiLine: false,
    );
    return phoneRegex.hasMatch(phoneNumber);
  }
}
