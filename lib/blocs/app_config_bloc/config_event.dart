import 'package:equatable/equatable.dart';
import 'package:basebloc/models/models.dart';
import 'package:flutter/material.dart';

class ConfigEvent extends Equatable {
  const ConfigEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends ConfigEvent {}

class UpdateApiConfigEvent extends ConfigEvent {
  const UpdateApiConfigEvent(this.newConfig) : assert(newConfig != null);

  final ApiConfig newConfig;

  @override
  List<Object> get props => [newConfig];

  @override
  String toString() => 'UpdateApiConfigEvent { newConfig: $newConfig}';
}

class UpdateAppThemeEvent extends ConfigEvent {
  const UpdateAppThemeEvent(this.newTheme) : assert(newTheme != null);

  final AppThemeStyle newTheme;

  @override
  List<Object> get props => [newTheme];

  @override
  String toString() => 'UpdateAppThemeEvent { newTheme: $newTheme }';
}

class UpdateLocalizationEvent extends ConfigEvent {
  const UpdateLocalizationEvent(this.newLocale) : assert(newLocale != null);

  final Locale newLocale;

  @override
  List<Object> get props => [newLocale];

  @override
  String toString() => 'UpdateLocalizationEvent { newLocale : $newLocale }';
}
