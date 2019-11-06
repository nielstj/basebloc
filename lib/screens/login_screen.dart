import 'package:basebloc/blocs/blocs.dart';
import 'package:basebloc/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: RaisedButton(
          child: Text(I18n.of(context).login),
          onPressed: () => BlocProvider.of<AuthenticationBloc>(context)
              .add(LoggedIn(token: 'Token')),
        )),
      );
}
