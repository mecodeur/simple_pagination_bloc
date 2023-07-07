import 'package:pagination_bloc/domain/entities/product_entity.dart';

class ProductsModel extends ProductEntity {
  const ProductsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.thumbnail,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductsModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      thumbnail: jsonData['thumbnail'],
    );
  }
}
