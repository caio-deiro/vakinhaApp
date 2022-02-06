import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/shared/services/auth_service.dart';

class SplashController extends GetxController {
  void checkLoggged() {
    Get.putAsync(() => AuthService().init());
  }
}
