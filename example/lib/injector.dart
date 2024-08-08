import 'package:fancy_flutter/fancy.dart';
import 'auth_controller.dart';
import 'auth_service.dart';

class AppDependenciesEnjector extends FancyBaseInjector {
  @override
  void registerDependencies() {
    Fancy.register(() => AuthService(), permanent: true);
    Fancy.register(() => AuthController());
  }
}
