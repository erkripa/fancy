import 'package:fancy_flutter/fancy_flutter.dart';
import 'package:fancy_flutter/src/fancy_mixin.dart';
import 'package:flutter/material.dart';

class FancyBuilder<T extends FancyBaseController> extends StatefulWidget {
  final ControllerBuilder builder;
  const FancyBuilder({super.key, required this.builder});

  @override
  State<FancyBuilder> createState() => _FancyBuilderState<T>();
}

class _FancyBuilderState<T extends FancyBaseController> extends State<FancyBuilder<T>> with FancyStateUpdaterMixin {
  T? controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (controller != null) return;
    controller = FancyStateInjector.of(context).injector.get<T>();
    controller?.onInit();
    controller?.addListener(fancyUpdate);
  }

  @override
  void dispose() {
    controller?.removeListener(fancyUpdate);
    controller?.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) return const SizedBox.shrink();
    return widget.builder(controller);
  }
}
