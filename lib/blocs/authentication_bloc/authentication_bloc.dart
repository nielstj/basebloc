import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:basebloc/Repositories/authentication_repository.dart';
import './authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({@required this.authRepository})
      : assert(authRepository != null);

  final AuthenticationRepository authRepository;

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is CheckLogStatus) {
      yield* _mapCheckLogStatusToState(event);
    } else if (event is LoggedIn) {
      yield* _mappLoggedInToState(event);
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState(event);
    }
  }

  Stream<AuthenticationState> _mapCheckLogStatusToState(CheckLogStatus event) async* {
    final bool hasToken = await authRepository.hasToken();
    if (hasToken) {
      final token = await authRepository.authenticateUser();
      yield AuthenticationAuthenticated(token);
    } else {
      yield AuthenticationUnauthenticated();
    }
  }

  Stream<AuthenticationState> _mappLoggedInToState(LoggedIn event) async* {
    yield AuthenticationLoading();
    await authRepository.persistToken();
    yield AuthenticationAuthenticated(event.token);
  }

  Stream<AuthenticationState> _mapLoggedOutToState(LoggedOut event) async* {
    yield AuthenticationLoading();
    await authRepository.persistToken();
    yield AuthenticationUnauthenticated();
  }
}
