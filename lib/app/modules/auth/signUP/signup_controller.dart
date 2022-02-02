import 'dart:developer';

import 'package:get/get.dart';

import 'package:vakinha_burguer_mobile/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burguer_mobile/app/shared/mixins/loader_mixins.dart';
import 'package:vakinha_burguer_mobile/app/shared/mixins/messages_mixins.dart';
import 'package:vakinha_burguer_mobile/app/shared/restClient/restClient.dart';

class SignupController extends GetxController with LoaderMixins, MessagesMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;

  final _message = Rxn<MessageModel>();

  SignupController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
    loaderListener(_loading);
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      await _authRepository.register(name, password, email);
      _loading.toggle();
      Get.back();
      _message(
        MessageModel(
            type: MessageType.info,
            title: 'Sucesso',
            message: 'Cadastro feito com sucesso'),
      );
    } on RestclientException catch (e, s) {
      _loading.toggle();
      log('erro ao registrar usuario', error: e, stackTrace: s);
      _message(
        MessageModel(
            type: MessageType.error, title: 'erro', message: e.message),
      );
    } catch (e, s) {
      _loading.toggle();
      log('erro ao registrar usuario', error: e, stackTrace: s);
      _message(
        MessageModel(
          type: MessageType.error,
          title: 'erro',
          message: 'erro ao registrar usuário',
        ),
      );
    }
  }
}
