import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/shared/restClient/restClient.dart';

class ApliccationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Restclient(), fenix: true);
  }
}
