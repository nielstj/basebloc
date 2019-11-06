import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  const AuthenticationAuthenticated(this.token);
  final String token;

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'AuthenticationAuthenticated { token : $token }';
}

class AuthenticationLoading extends AuthenticationState {}
