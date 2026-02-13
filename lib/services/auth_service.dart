import 'package:car_wazz/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userService = UserService();

  Stream<User?> authState() {
    return _auth.authStateChanges();
  }

  Future<UserCredential> login(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
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
    await _userService.createUser(cred.user!.uid, email, name);
    _auth.signOut();
    return cred;
  }

  Future<void> logout() {
    return _auth.signOut();
  }
}
