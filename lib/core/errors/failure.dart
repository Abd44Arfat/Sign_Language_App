class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() {
    return message; // This will return the message when toString is called
  }
}
