import 'package:basebloc/generated/i18n.dart';
import 'package:basebloc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:basebloc/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(I18n.of(context).greetTo('nielstj')),
            leading: IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () =>
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.color_lens),
                onPressed: () => BlocProvider.of<ConfigBloc>(context).add(
                    UpdateAppThemeEvent(state.themeStyle == AppThemeStyle.light
                        ? AppThemeStyle.dark
                        : AppThemeStyle.light)),
              ),
              IconButton(
                icon: Icon(Icons.network_wifi),
                onPressed: () => BlocProvider.of<ConfigBloc>(context)
                    .add(UpdateApiConfigEvent(ApiConfig.production())),
              ),
              IconButton(
                icon: Icon(Icons.language),
                onPressed: () => BlocProvider.of<ConfigBloc>(context)
                    .add(UpdateLocalizationEvent(Locale('zh', 'ZH'))),
              )
            ],
          ),
          body: Center(
            child: Text(state.toString()),
          ),
        ),
      );
}
