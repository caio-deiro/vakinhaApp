import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/models/product_model.dart';
import 'package:vakinha_burguer_mobile/app/repositories/products/product_repository.dart';
import 'package:vakinha_burguer_mobile/app/shared/mixins/loader_mixins.dart';
import 'package:vakinha_burguer_mobile/app/shared/mixins/messages_mixins.dart';

class MenuController extends GetxController with LoaderMixins, MessagesMixin {
  ProductRepository _productRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } catch (e, s) {
      log(
        'erro ao buscar produtos',
        error: e,
        stackTrace: s,
      );
      _message(MessageModel(
          type: MessageType.error,
          title: 'Erro!',
          message: 'Erro ao buscar produtos'));
    }
  }

  Future<void> findAllProducts() async {
    final products = await _productRepository.findAll();
    menu.assignAll(products);
  }

  refreshPage() async {
    try {
      await findAllProducts();
    } catch (e, s) {
      log(
        'erro ao buscar produtos',
        error: e,
        stackTrace: s,
      );
      _message(MessageModel(
          type: MessageType.error,
          title: 'Erro!',
          message: 'Erro ao buscar produtos'));
    }
  }
}
