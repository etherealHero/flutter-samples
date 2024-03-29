import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/state/bloc_observer.dart';
import 'src/pages/home_page.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyHomePage());
}
