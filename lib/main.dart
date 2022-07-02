import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_list/app.dart';
import 'package:infinit_list/service_locator.dart';
import 'package:infinit_list/simple_bloc_observer.dart';

void main() {
  initServiceLocator();
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: SimpleBlocObserver(),
  );
}
