import 'package:basebloc/network_client/protoclient.dart';
import 'package:equatable/equatable.dart';

class AuthenticationRepository extends Equatable {
  AuthenticationRepository({this.client}) : assert(client != null);

  final Protoclient client;

  Future<String> authenticateUser() async {
    print('$client');
    return client.call();
  }

  Future<void> deauthenticateUser() {
    print('$client');
    return Future.delayed(Duration(seconds: 1));
  }

  Future<void> persistToken() {
    print('$client');
    return Future.delayed(Duration(seconds: 1));
  }

  Future<bool> hasToken() async {
    print('$client');
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  @override
  List<Object> get props => [client];
}
