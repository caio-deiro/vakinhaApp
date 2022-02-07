import 'package:vakinha_burguer_mobile/app/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll();
}
