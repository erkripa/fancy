import 'package:fancy_flutter/fancy.dart';

class Fancy {
  static void register<T>(T Function() factory, {bool permanent = false}) {
    FancyDependencyInjector().register<T>(factory, permanent: permanent);
  }

  static T get<T>() {
    return FancyDependencyInjector().get<T>();
  }

  static void unregister<T>() {
    FancyDependencyInjector().unregister<T>();
  }
}
