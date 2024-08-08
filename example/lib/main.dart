import 'package:example/injector.dart';
import 'package:fancy_flutter/fancy.dart';
import 'package:flutter/material.dart';
import 'auth_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final injector = AppDependenciesEnjector();
  injector.registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FancyMaterialApp(
      injector: FancyDependencyInjector(),
      child: const MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FancyBuilder<AuthController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: controller.updateUsername,
                ),
                TextField(
                  onChanged: controller.updatePassword,
                ),
                ElevatedButton(
                  onPressed: controller.login,
                  child: const Text('Login'),
                ),
                // Add a Text widget to observe state changes
                Text('Username: ${controller.username}'),
                Text('Password: ${controller.password}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
