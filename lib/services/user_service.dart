import 'package:car_wazz/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _userCollection =>
      _firestore.collection('user');

  Future<void> createUser(String id, String email, String username) async {
    User user = User(userId: id, username: username, email: email);
    await _userCollection.doc(user.userId).set(user.toFirestore());
  }

  Future<User?> getUser(String id) async {
    final doc = await _userCollection.doc(id).get();
    if (!doc.exists) return null;
    return User.fromFirestore(doc.data()!, doc.id);
  }

  Future<void> updateUser(String id, Map<String, dynamic> update) async {
    await _userCollection.doc(id).update(update);
  }
}
