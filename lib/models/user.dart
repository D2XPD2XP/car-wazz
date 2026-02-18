class UserModel {
  final String userId;
  final String username;
  final String email;

  UserModel({required this.userId, required this.username, required this.email});

  factory UserModel.fromFirestore(Map<String, dynamic> data, String id) {
    return UserModel(
      userId: id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'username': username, 'email': email};
  }
}
