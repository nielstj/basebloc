import 'dart:io' show Platform;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ApiConfig extends Equatable{
  ApiConfig({
    @required this.baseUrl,
    @required this.scheme,
    @required this.port,
  })  : assert(baseUrl != null),
        assert(scheme != null),
        assert(port != null);

  factory ApiConfig.local() => ApiConfig(
      baseUrl: Platform.isAndroid ? '10.0.2.2' : '127.0.0.1',
      scheme: 'http',
      port: 8080);

  factory ApiConfig.staging() => ApiConfig(
      baseUrl: 'staging.coach.cdmp.cloud',
      scheme: 'https',
      port: 433);

  factory ApiConfig.production() => ApiConfig(
      baseUrl: 'coach.cdmp.cloud',
      scheme: 'https',
      port: 433);

  final String baseUrl;
  final String scheme;
  final int port;

  @override
  List<Object> get props => [baseUrl, scheme, port];
  @override
  String toString() => '''ApiConfig: { 
    baseUrl: $baseUrl,
    scheme: $scheme,
    port: $port,
    }''';
}
