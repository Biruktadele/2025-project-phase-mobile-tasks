import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import '../bloc/product_bloc.dart';
import '../widget/product_create_widget/product_Add_button.dart';
import '../widget/product_create_widget/product_cancel_button.dart';
import '../widget/product_create_widget/product_text_box.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        id: 0, // or auto-generated
        name: _nameController.text,
        price: double.parse(_priceController.text),
        description: _descriptionController.text,
        image: _imageController.text,
      );

      context.read<ProductBloc>().add(CreateProductEvent(product));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Product')),
      body: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } 
          else if (state is ProductLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product Created!')),
            );
            Navigator.of(context).pop();
          }

          else if (state is ProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 40),
                ProductInput(priceController: _nameController , hintText: 'Name' , label: 'Name'),                
                const SizedBox(height: 20),

                ProductInput(priceController: _priceController , hintText: 'Price                                                       \$' , label: 'Price'),
                const SizedBox(height: 20),

                ProductInput(priceController: _imageController , hintText: 'Image URL' , label: 'Image URL'),
                const SizedBox(height: 20),

                ProductInput(priceController: _descriptionController , hintText: 'Description' , label: 'Description'),                
                const SizedBox(height: 20),
                
                AddButton(onSubmit: _submit),
                const SizedBox(height: 20),

                const CancelButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




 

Widget descriptionInput(TextEditingController descriptionController ) {
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