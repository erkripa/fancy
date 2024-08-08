import 'package:flutter/material.dart';

export 'package:fancy/src/fancy.dart';
export 'package:fancy/src/fancy_builder.dart';
export 'package:fancy/src/fancy_dependency_injector.dart';
export 'package:fancy/src/fancy_base_injector.dart';
export 'package:fancy/src/fancy_base_controller.dart';
export 'package:fancy/src/fancy_utils.dart';

typedef ControllerBuilder<T> = Widget Function(T controller);
