import 'dart:developer';

class FancyDependencyInjector {
  static final FancyDependencyInjector _instance = FancyDependencyInjector._internal();
  factory FancyDependencyInjector() => _instance;

  FancyDependencyInjector._internal();

  final Map<Type, dynamic Function()> _factories = {};
  final Map<Type, dynamic> _instances = {};
  final Map<Type, bool> _permanentInstances = {};

  void register<T>(dynamic Function() factory, {bool permanent = false}) {
    _factories[T] = factory;
    _permanentInstances[T] = permanent;
  }

  T get<T>() {
    if (_instances.containsKey(T)) {
      return _instances[T] as T;
    }
    if (_factories.containsKey(T)) {
      final instance = _factories[T]!();
      _instances[T] = instance;
      _log('Created instance of ${T.toString()}');
      return instance;
    }
    throw Exception('No factory registered for type $T');
  }

  void unregister<T>() {
    if (_permanentInstances[T] != true) {
      _log('Deleted instance of ${T.toString()}');
      _instances.remove(T);
    } else {
      _log('Attempted to delete permanent instance of ${T.toString()}');
    }
  }

  void _log(String message) {
    if (!const bool.fromEnvironment('dart.vm.product')) {
      log(message);
    }
  }
}
