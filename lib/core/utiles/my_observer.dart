import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    PrinterHelper('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onClose(BlocBase bloc) {
    PrinterHelper('onClose(${bloc.runtimeType})');
  }

  @override
  void onCreate(BlocBase bloc) {
    PrinterHelper('onCreate(${bloc.runtimeType})');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    PrinterHelper('onError(${bloc.runtimeType}, $error, $stackTrace)');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    PrinterHelper('onEvent(${bloc.runtimeType}, $event)');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    PrinterHelper('onTransition(${bloc.runtimeType}, $transition)');
  }
}

class PrinterHelper {
  final String message;
  PrinterHelper(this.message) {
    log(message);
  }
}
