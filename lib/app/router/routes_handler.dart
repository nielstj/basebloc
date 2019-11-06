import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:basebloc/screens/screens.dart';

// final Handler missingRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
//         MissingScreen());

// final Handler themeHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
//         ThemeSelectScreen());

// final langHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
//         LanguageSelectScreen());

final rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        RootScreen());

// final surveyHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
//         SurveyScreen());
