import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burguer_mobile/app/shared/constants/constants.dart';
import 'package:vakinha_burguer_mobile/app/shared/excepitons/user_notfound_excepiton.dart';
import 'package:vakinha_burguer_mobile/app/shared/mixins/loader_mixins.dart';
import 'package:vakinha_burguer_mobile/app/shared/mixins/messages_mixins.dart';
import 'package:vakinha_burguer_mobile/app/shared/restClient/restClient.dart';

class LoginController extends GetxController with LoaderMixins, MessagesMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
    loaderListener(_loading);
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.login(email, password);
      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLogged.id);
      _loading.toggle();
    } on UserNotfoundExcepiton catch (e, s) {
      _loading.toggle();
      log('Login ou senha inválidos', error: e, stackTrace: s);
      _message(
        MessageModel(
            type: MessageType.error,
            title: 'Erro',
            message: 'Login ou senha inválidos'),
      );
    }
  }
}
