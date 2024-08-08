import 'package:example/auth_service.dart';
import 'package:fancy_flutter/fancy_flutter.dart';

class AuthController extends FancyBaseController {
  final AuthService _authService = Fancy.get<AuthService>();

  String _username = '';
  String _password = '';

  String get username => _username;
  String get password => _password;

  void updateUsername(String username) {
    _username = username;
    notify();
  }

  void updatePassword(String password) {
    _password = password;
    notify();
  }

  void login() {
    // Handle login logic
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize auth state
  }

  @override
  void onStart() {
    super.onStart();
    // Start logic
  }

  @override
  void onDispose() {
    super.onDispose();
    // Cleanup logic
  }
}
