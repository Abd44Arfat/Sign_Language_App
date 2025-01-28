class SignupResponse {
  final String message;
  final User? user; // Change to a single User object

  SignupResponse({required this.message, this.user});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    // Check if the response contains a 'user' key
    if (json.containsKey('user') && json['user'] != null) {
      // Directly create a User object
      var userJson = json['user'] as Map<String, dynamic>;
      return SignupResponse(
        message: json['message'],
        user: User.fromJson(userJson), // Create User from JSON
      );
    } else {
      // Handle error response
      return SignupResponse(
        message: json['message'] ?? 'Unknown error occurred.',
        user: null, // No user on error
      );
    }
  }
}

class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
    );
  }
}