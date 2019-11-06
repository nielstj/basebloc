import 'package:basebloc/Repositories/authentication_repository.dart';
import 'package:basebloc/app/router/router.dart';
import 'package:basebloc/generated/i18n.dart';
import 'package:basebloc/models/models.dart';
import 'package:basebloc/network_client/protoclient.dart';
import 'package:flutter/material.dart';
import 'package:basebloc/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocListener<ConfigBloc, ConfigState>(
        listener: (context, state) {
          I18n.locale = state.locale;
        },
        child: BlocBuilder<ConfigBloc, ConfigState>(
          builder: (context, state) {
            return MaterialApp(
                onGenerateRoute: AppRouter.router.generator,
                localizationsDelegates: [
                  I18n.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: I18n.delegate.supportedLocales,
                theme: state.themeStyle == AppThemeStyle.light
                    ? ThemeData.light()
                    : ThemeData.dark(),
                builder: (context, widget) {
                  // final local = I18n.of(context);
                  final protoClient = Protoclient(
                      config: state.apiConfig,
                      client: http.Client(),
                      local: I18n.of(context));
                  print('Rebuild home $protoClient');
                  // print('current local :$local');

                  return BlocProvider<AuthenticationBloc>(
                    builder: (context) {
                      print('Rebuild authentication provider');

                      // TODO: UPDATE USER REPOSITORRY WITH NEW PROTOCLIENT

                      return AuthenticationBloc(
                          authRepository: AuthenticationRepository(
                        client: protoClient,
                      ))
                        ..add(CheckLogStatus());
                    },
                    child: widget,
                  );
                });
          },
        ),
      );
}
