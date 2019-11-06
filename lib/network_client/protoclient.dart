import 'dart:async';
import 'dart:typed_data';
import 'package:basebloc/generated/i18n.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:basebloc/models/models.dart';

class Protoclient {
  const Protoclient({
    @required this.config,
    @required this.client,
    @required this.local,
  })  : assert(config != null),
        assert(client != null),
        assert(local != null);

  final ApiConfig config;
  final http.Client client;
  final I18n local;

  Uri toServeUri(String path) => Uri(
      host: config.baseUrl,
      path: path,
      port: config.port,
      scheme: config.scheme);

  Future<String> call() async {
    await Future.delayed(Duration(seconds: 1));
    return local.greetTo('From Login');
  }

  @override
  String toString() => '''Protoclient: {
    $config,
    $client,
    $local
  }''';
}
