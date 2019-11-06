import 'package:basebloc/screens/home_screen.dart';
import 'package:basebloc/screens/login_screen.dart';
import 'package:basebloc/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basebloc/blocs/authentication_bloc/authentication.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashScreen();
          } else if (state is AuthenticationAuthenticated) {
            return HomeScreen();
          } else if (state is AuthenticationUnauthenticated) {
            return LoginScreen();
          } else if (state is AuthenticationLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      );
}
