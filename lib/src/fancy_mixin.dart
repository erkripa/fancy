// Custom ListenableMixin to manage listeners
import 'package:flutter/material.dart';

mixin ListenableMixin implements Listenable {
  final _listeners = <VoidCallback>[];

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }
}

// Custom ListNotifierMixin to notify listeners
mixin ListNotifierMixin on ListenableMixin {
  @protected
  void notifyFancyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }

  @mustCallSuper
  void dispose() {
    _listeners.clear();
  }
}

// Custom FancyStateMixin for state updates
mixin FancyStateMixin on ListNotifierMixin {
  void notify() => notifyFancyListeners();
}

mixin FancyStateUpdaterMixin<T extends StatefulWidget> on State<T> {
  // To avoid the creation of an anonym function to be GC later.
  /// Experimental method to replace setState((){});
  /// Used with fancyUpdate.
  void fancyUpdate() {
    if (mounted) setState(() {});
  }
}
