import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/models/user_model.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burguer_mobile/app/shared/excepitons/user_notfound_excepiton.dart';
import 'package:vakinha_burguer_mobile/app/shared/restClient/restClient.dart';

class AuthRepositoryImp implements AuthRepository {
  final Restclient _restClient;
  AuthRepositoryImp({
    required Restclient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String password, String email) async {
    final response = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });
    if (response.hasError) {
      var message = 'erro ai registrar usuario';
      if (response.hashCode == 400) {
        message = response.body['error'];
      }

      log(
        message,
        error: response.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestclientException(message: message);
    }

    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await _restClient.post('/auth/', {
      'email': email,
      'password': password,
    });

    if (response.hasError) {
      if (response.statusCode == 403) {
        log(
          'usuario ou senha inválidos',
          error: response.statusText,
          stackTrace: StackTrace.current,
        );
        throw UserNotfoundExcepiton();
      }

      log(
        'erro ao autenticar o usuário (${response.statusCode})',
        error: response.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestclientException(message: 'erro ao autenticar usuario');
    }
    return UserModel.fromMap(response.body);
  }
}
