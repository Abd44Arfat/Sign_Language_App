class LoginResponse {
  final String message;
  final String token; // New token field
  final User? user; // Make user nullable to handle error responses

  LoginResponse({required this.message, required this.token, this.user});
  
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    // Check if the response contains a 'user' key
    String token = json['token'] ?? ''; // Handle missing token
    return LoginResponse(
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