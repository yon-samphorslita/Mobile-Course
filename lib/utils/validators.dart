class Validators {
  static String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegExp = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!emailRegExp.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final digitsOnly = RegExp(r'^\d{7,15}$');
    if (!digitsOnly.hasMatch(value)) return 'Enter a valid phone number';
    return null;
  }
}
