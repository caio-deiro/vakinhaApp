import 'dart:convert';

class ProductModel {
  int id;
  final String image;
  final double price;
  final String name;
  final String description;
  ProductModel({
    required this.id,
    required this.image,
    required this.price,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'price': price,
      'name': name,
      'description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      image: map['image'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
