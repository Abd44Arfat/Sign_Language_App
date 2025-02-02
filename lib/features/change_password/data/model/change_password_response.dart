class ChangePasswordResponse {
  final String message;
  final String token;
  final User? user;

  ChangePasswordResponse({
    required this.message,
    required this.token,
    required this.user,
  });

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    String token = json['token'] ?? ''; // Handle missing token
    return ChangePasswordResponse(
      message: json['message'] ?? 'Unknown error occurred.',
      token: token, // Use the token variable
      user: json.containsKey('user') && json['user'] != null
          ? User.fromJson(json['user'])
          : null, // Parse the user if present
    );
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
