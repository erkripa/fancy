import 'package:fancy/src/fancy_mixin.dart';
import 'package:flutter/material.dart';

abstract class FancyBaseController with ListenableMixin, ListNotifierMixin, FancyStateMixin {
  void onInit() {
    // notify();
  }

  void onStart() {}
  void onDispose() {}

  @mustCallSuper
  void onClose() {
    onDispose();
  }
}
