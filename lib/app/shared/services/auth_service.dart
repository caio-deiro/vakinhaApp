import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/shared/constants/constants.dart';

class AuthService extends GetxService {
  final isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService?> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      isLogged(value != null);
    });

    ever<bool?>(isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        Get.offAllNamed('/home');
      }
    });

    isLogged(getUsderId() != null);
    return this;
  }

  void logout() => _getStorage.write(Constants.USER_KEY, null);

  int? getUsderId() => _getStorage.read(Constants.USER_KEY);
}
