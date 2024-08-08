````markdown
# Fancy

Fancy is a lightweight state management package for Flutter that simplifies controller management and dependency injection. Inspired by frameworks like GetX, Fancy provides a streamlined way to manage state, dependencies, and UI updates with minimal boilerplate.

## Features

- **Efficient State Management**: Use `FancyBaseController` to manage your application's state with built-in support for initialization, cleanup, and listener management.
- **Dependency Injection**: Easily register and retrieve dependencies with `Fancy`, allowing for straightforward dependency management and service location.
- **Custom Widgets**: Utilize `FancyBuilder` to rebuild widgets when state changes, integrating seamlessly with your controllers.
- **Inherited Widget Integration**: Leverage `FancyMaterialApp` to provide a consistent context for dependency injection across your app.

## Getting Started

### Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  fancy: 0.0.1 #or latest
```
````

### Usage

1. **Define Controllers**: Create controllers by extending `FancyBaseController` and implement your business logic.

2. **Register Dependencies**: Use `Fancy.register` to register services and controllers.

3. **Build Widgets**: Use `FancyBuilder` to create reactive UI components that automatically rebuild when state changes.

### Example

```dart
import 'package:flutter/material.dart';
import 'package:fancy/fancy.dart';

// Example service
class AuthService {
  // AuthService implementation
}

// Example controller
class AuthController extends FancyBaseController {
  final AuthService _authService = Fancy.get<AuthService>();

  String _username = '';
  String _password = '';

  String get username => _username;
  String get password => _password;

  void updateUsername(String username) {
    _username = username;
    fancyUpdate();
  }

  void updatePassword(String password) {
    _password = password;
    fancyUpdate();
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

import 'package:example/injector.dart';
import 'package:fancy/fancy.dart';
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


```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
