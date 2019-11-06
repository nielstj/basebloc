import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class CheckLogStatus extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  const LoggedIn({@required this.token});

  final String token;

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token"  $token }';
}

class LoggedOut extends AuthenticationEvent {}
