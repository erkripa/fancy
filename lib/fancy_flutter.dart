import 'package:flutter/material.dart';

export 'package:fancy_flutter/src/fancy_flutter.dart';
export 'package:fancy_flutter/src/fancy_builder.dart';
export 'package:fancy_flutter/src/fancy_dependency_injector.dart';
export 'package:fancy_flutter/src/fancy_base_injector.dart';
export 'package:fancy_flutter/src/fancy_base_controller.dart';
export 'package:fancy_flutter/src/fancy_utils.dart';

typedef ControllerBuilder<T> = Widget Function(T controller);
