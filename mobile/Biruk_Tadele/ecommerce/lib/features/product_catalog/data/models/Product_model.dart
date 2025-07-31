import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.description,
    required super.image,
  });

      factory ProductModel.fromJson(Map<String, dynamic> json) {
        return ProductModel(
          id: json['id'],
          name: json['name'],
          price: json['price'],
          description: json['description'],
          image: json['image'],
        );
      }

      Map<String, dynamic> toJson() {
        return {
          'id': id,
          'name': name,
          'price': price,
          'description': description,
          'image': image,
        };
      }
}
