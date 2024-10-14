class SignupResponse {
  final String message;
  final List<User>? users; // Change to a list of User

  SignupResponse({required this.message, this.users});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    // Check if the response contains a 'user' key
    if (json.containsKey('user') && json['user'] != null) {
      // Cast to List and map to User
      var usersList = json['user'] as List;
      return SignupResponse(
        message: json['message'],
        users: usersList.map((userJson) => User.fromJson(userJson)).toList(),
      );
    } else {
      // Handle error response
      return SignupResponse(
        message: json['message'] ?? 'Unknown error occurred.',
        users: null, // No users on error
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