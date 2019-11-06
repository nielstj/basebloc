import 'package:basebloc/app/router/router.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:basebloc/app/app.dart';
import 'package:basebloc/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basebloc/blocs/delegate/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  AppRouter.setupRouter();
  runApp(BlocProvider<ConfigBloc>(
    builder: (context) => ConfigBloc(),
    child: BaseApp(),
  ));
}
