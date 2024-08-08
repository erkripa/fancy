import 'package:flutter/material.dart';
import 'fancy_dependency_injector.dart';

// Utility class for simplified dependency management
class FancyStateInjector extends InheritedWidget {
  final FancyDependencyInjector injector;

  const FancyStateInjector({
    super.key,
    required this.injector,
    required super.child,
  });

  static FancyStateInjector of(BuildContext context) {
    final FancyStateInjector? result = context.dependOnInheritedWidgetOfExactType<FancyStateInjector>();
    assert(result != null, 'No Fancy found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FancyStateInjector oldWidget) {
    return injector != oldWidget.injector;
  }
}
