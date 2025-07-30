// ignore_for_file: override_on_non_overriding_member

class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String image;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, description, price, image];
}