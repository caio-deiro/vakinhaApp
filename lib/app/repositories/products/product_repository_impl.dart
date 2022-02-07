import 'dart:developer';

import 'package:vakinha_burguer_mobile/app/models/product_model.dart';
import 'package:vakinha_burguer_mobile/app/repositories/products/product_repository.dart';
import 'package:vakinha_burguer_mobile/app/shared/restClient/restClient.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Restclient _restclient;

  ProductRepositoryImpl({required Restclient restclient})
      : _restclient = restclient;
  @override
  Future<List<ProductModel>> findAll() async {
    try {
      final response = await _restclient.get('/products/');
      return (response.body as List)
          .map((items) => ProductModel.fromMap(items))
          .toList();
    } on RestclientException catch (e) {
      log(
        'error ao buscar produtos ${e.code}',
        error: e.message,
        stackTrace: StackTrace.current,
      );
      throw RestclientException(message: 'erro ao buscar produtos');
    }
  }
}
