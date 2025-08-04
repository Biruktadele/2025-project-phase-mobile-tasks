import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.description,
    required super.image,
  });

  /// Creates a [ProductModel] from a [Product] entity
  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      description: product.description,
      image: product.image,
    );
  }

  /// Converts this model to a [Product] entity
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      price: price,
      description: description,
      image: image,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['title'],
      price: (json['price'] as num).toDouble(),
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
