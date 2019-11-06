import 'package:bloc/bloc.dart';
import './config.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  @override
  ConfigState get initialState => ConfigState.initial();

  @override
  Stream<ConfigState> mapEventToState(ConfigEvent event) async* {
    if (event is AppStarted) {
      yield state;
    } else if (event is UpdateApiConfigEvent) {
      yield state.copyWith(newConfig: event.newConfig);
    } else if (event is UpdateAppThemeEvent) {
      yield state.copyWith(newStyle: event.newTheme);
    } else if (event is UpdateLocalizationEvent) {
      yield state.copyWith(newLocale: event.newLocale);
    }
  }
}
