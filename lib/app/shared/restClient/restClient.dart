import 'package:get/get.dart';

class Restclient extends GetConnect {
  String _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';

  Restclient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestclientException implements Exception {
  final int? code;
  final String message;
  RestclientException({
    this.code,
    required this.message,
  });
}
