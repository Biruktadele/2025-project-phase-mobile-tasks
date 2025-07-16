import 'dart:io';


class Product {
  String _name;
  String _description;
  double _price;

  Product({
    required String name,
    required String description,
    required double price,
  }) : _name = name,
       _description = description,
       _price = price;


  String get name => _name;
  String get description => _description;
  double get price => _price;


  set name(String name) => _name = name;
  set description(String description) => _description = description;
  set price(double price) {
    if (price > 0) {
      _price = price;
    } else {
      print("Price must be greater than 0.");
    }
  }

  void display() {
    print('Name: $_name');
    print('Description: $_description');
    print('Price: \$$_price');
  }
}

class ProductManager {
  final List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
    print("Product added successfully!\n");
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print("No products available.\n");
    } else {
      for (var i = 0; i < _products.length; i++) {
        print("Product ${i + 1}:");
        _products[i].display();
        print('');
      }
    }
  }

  void viewSingleProduct(int index) {
    if (index >= 0 && index < _products.length) {
      _products[index].display();
    } else {
      print("Invalid product index.\n");
    }
  }

  void editProduct(int index) {
    if (index < 0 || index >= _products.length) {
      print("Invalid product index.\n");
      return;
    }

    stdout.write("Enter new name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter new description: ");
    String description = stdin.readLineSync()!;

    stdout.write("Enter new price: ");
    double price = double.parse(stdin.readLineSync()!);

    _products[index].name = name;
    _products[index].description = description;
    _products[index].price = price;

    print("Product updated successfully.\n");
  }

  void deleteProduct(int index) {
    if (index >= 0 && index < _products.length) {
      _products.removeAt(index);
      print("Product deleted successfully.\n");
    } else {
      print("Invalid product index.\n");
    }
  }

  int get productCount => _products.length;
}

void main() {
  ProductManager manager = ProductManager();

  while (true) {
    print("=== eCommerce Product Management ===");
    print("1. Add Product");
    print("2. View All Products");
    print("3. View Single Product");
    print("4. Edit Product");
    print("5. Delete Product");
    print("6. Exit");
    stdout.write("Enter your choice: ");
    String? input = stdin.readLineSync();
    int choice = int.tryParse(input ?? '') ?? 0;

    switch (choice) {
      case 1:
        stdout.write("Enter product name: ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter product description: ");
        String description = stdin.readLineSync()!;
        stdout.write("Enter product price: ");
        double price = double.parse(stdin.readLineSync()!);
        Product product = Product(
          name: name,
          description: description,
          price: price,
        );
        manager.addProduct(product);
        break;

      case 2:
        manager.viewAllProducts();
        break;

      case 3:
        stdout.write(
          "Enter product number to view (1-${manager.productCount}): ",
        );
        int index = int.parse(stdin.readLineSync()!) - 1;
        manager.viewSingleProduct(index);
        break;

      case 4:
        stdout.write(
          "Enter product number to edit (1-${manager.productCount}): ",
        );
        int index = int.parse(stdin.readLineSync()!) - 1;
        manager.editProduct(index);
        break;

      case 5:
        stdout.write(
          "Enter product number to delete (1-${manager.productCount}): ",
        );
        int index = int.parse(stdin.readLineSync()!) - 1;
        manager.deleteProduct(index);
        break;

      case 6:
        print("Exiting program...");
        exit(0);

      default:
        print("Invalid choice. Please try again.\n");
    }
  }
}
