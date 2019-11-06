import 'package:flutter/material.dart';
import 'package:basebloc/generated/i18n.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(I18n.of(context).splash),
        ),
      );
}
