import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> authState() {
    return _auth.authStateChanges();
  }

  Future<UserCredential> login(
    String email,
    String password,
  ) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> register(
    String email,
    String password,
    String name,
  ) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore
        .collection('user')
        .doc(cred.user!.uid)
        .set({
      'user_id': cred.user!.uid,
      'email': email,
      'username': name,
    });

    return cred;
  }

  Future<void> logout() {
    return _auth.signOut();
  }
}
