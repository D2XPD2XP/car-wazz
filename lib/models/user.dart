class User {
  final String userId;
  final String username;
  final String email;

  User({required this.userId, required this.username, required this.email});

  factory User.fromFirestore(Map<String, dynamic> data, String id) {
    return User(
      userId: id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'username': username, 'email': email};
  }
}
