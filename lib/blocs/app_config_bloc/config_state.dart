import 'package:equatable/equatable.dart';
import 'package:basebloc/models/models.dart';
import 'package:flutter/widgets.dart';

class ConfigState extends Equatable {
  const ConfigState({
    @required this.apiConfig,
    @required this.themeStyle,
    @required this.locale,
  })  : assert(apiConfig != null),
        assert(themeStyle != null),
        assert(locale != null);

  final ApiConfig apiConfig;
  final AppThemeStyle themeStyle;
  final Locale locale;

  @override
  List<Object> get props => [apiConfig, themeStyle, locale];

  factory ConfigState.initial() => ConfigState(
        apiConfig: ApiConfig.local(),
        themeStyle: AppThemeStyle.light,
        locale: Locale('us', 'US'),
      );

  ConfigState copyWith({
    ApiConfig newConfig,
    AppThemeStyle newStyle,
    Locale newLocale,
  }) =>
      ConfigState(
        apiConfig: newConfig ?? this.apiConfig,
        themeStyle: newStyle ?? this.themeStyle,
        locale: newLocale ?? this.locale,
      );

  @override
  String toString() => '''ConfigState: { 
    apiConfig: ${apiConfig.toString()},
    themeStyle: $themeStyle,
    locale: $locale,
    }''';
}
