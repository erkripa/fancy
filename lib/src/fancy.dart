import 'package:flutter/material.dart';
import 'fancy_dependency_injector.dart';

// Utility class for simplified dependency management
class FancyMaterialApp extends InheritedWidget {
  final FancyDependencyInjector injector;

  const FancyMaterialApp({
    super.key,
    required this.injector,
    required super.child,
  });

  static FancyMaterialApp of(BuildContext context) {
    final FancyMaterialApp? result = context.dependOnInheritedWidgetOfExactType<FancyMaterialApp>();
    assert(result != null, 'No Fancy found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FancyMaterialApp oldWidget) {
    return injector != oldWidget.injector;
  }
}
