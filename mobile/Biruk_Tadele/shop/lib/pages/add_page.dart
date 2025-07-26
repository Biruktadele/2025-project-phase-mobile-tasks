import 'package:flutter/material.dart';
import 'package:shop/model/product.dart';

class AddPage extends StatefulWidget {
  final Product item;
  const AddPage({super.key, required this.item});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  late TextEditingController nameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.item.name);
    descriptionController = TextEditingController(text: widget.item.description);
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _saveProduct() {
    final product = Product(
      name: nameController.text,
      description: descriptionController.text,
      price: widget.item.price,
      image: widget.item.image,
      category: widget.item.category,
      rating: widget.item.rating,
    );
    Navigator.pop(context, product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageInput(),
              const SizedBox(height: 16),
              _NameInput(),
              const SizedBox(height: 16),
              _CategoryInput(),
              const SizedBox(height: 16),
              _PriceInput(),
              const SizedBox(height: 16),
              _DescriptionInput(),
              const SizedBox(height: 16),
              _AddButton(),
              const SizedBox(height: 16),
              _DeleteButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// A widget for displaying an image input field.
  ///
  /// The image input field is a container with a light gray background and a
  /// rounded corner. It contains an icon and a text.
  ///
  /// The icon is the image icon from the Material Design Icons library. The
  /// text is "Upload Image" and is displayed with a font size of 16 and a
  /// color of #58595A.
  Widget _ImageInput() {
    return Container(
      height: 160,
      width: 350,
      decoration: BoxDecoration(
        // The container has a light gray background.
        color: const Color(0xFFF3F3F3),
        // The container has a rounded corner with a radius of 16.
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.image,
            size: 70,
            color: Color.fromARGB(255, 88, 90, 92),
          ),
          const SizedBox(height: 6),
          const Text(
            'Upload Image',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 88, 90, 92),
            ),
          ),
        ],
      ),
    );
  }

  Widget _NameInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 88, 90, 92),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: 'Product Name',
          ),
        ),
      ],
    );
  }

  /// A widget for displaying a category input field.
  ///
  /// The category input field is a column with a text and a text field.
  ///
  /// The text is "Category" and is displayed with a font size of 16 and a
  /// color of #58595A. The text field is used to enter the category of the
  /// product.
  Widget _CategoryInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 88, 90, 92),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: 'Category',
          ),
        ),
      ],
    );
  }

  Widget _PriceInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 88, 90, 92),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: 'Price                                                       \$',
          ),
        ),
      ],
    );
  }

  Widget _DescriptionInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 88, 90, 92),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: descriptionController,
          maxLines: 5,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: 'Description',
          ),
        ),
      ],
    );
  }

  Widget _AddButton() {
    return ElevatedButton(
      onPressed: _saveProduct,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(350, 50),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text('Add'),
    );
  }

  Widget _DeleteButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(350, 50),
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        side: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text('Delete'),
    );
  }
}
