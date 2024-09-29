class SignupResponse {
  final String message;
  final User? user; // Make user nullable to handle error responses

  SignupResponse({required this.message, this.user});
  
  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    // Check if the response contains a 'user' key
    if (json.containsKey('user') && json['user'] != null) {
      return SignupResponse(
        message: json['message'],
        user: User.fromJson(json['user']), // Parse the user if present
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
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}