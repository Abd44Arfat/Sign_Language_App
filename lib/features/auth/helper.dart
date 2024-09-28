String? emailValidator(String? value) {
  final String emailPattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(emailPattern);
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}