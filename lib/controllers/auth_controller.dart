import 'package:car_wazz/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  final firebaseUser = Rxn<User>();
  final isLoading = false.obs;

  @override
  void onInit() {
    firebaseUser.bindStream(_authService.authState());
    super.onInit();
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      await _authService.login(email, password);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String email, String password, String name) async {
    try {
      isLoading.value = true;
      await _authService.register(email, password, name);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() {
    return _authService.logout();
  }
}
