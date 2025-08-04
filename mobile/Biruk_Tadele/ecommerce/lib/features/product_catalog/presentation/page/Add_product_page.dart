// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';

// import '../../domain/entities/product.dart';
// import '../bloc/product_bloc.dart';


// class AddProductPage extends StatefulWidget {
//   const AddProductPage({super.key});

//   @override
//   State<AddProductPage> createState() => _AddProductPageState();
// }
// class _AddProductPageState extends State<AddProductPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _priceController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   final _imageController = TextEditingController();

//   void _submit() {
//     if (_formKey.currentState!.validate()) {
//       final product = Product(
//         id: 0, // or auto-generated
//         name: _nameController.text,
//         price: double.parse(_priceController.text),
//         description: _descriptionController.text,
//         image: _imageController.text,
//       );

//       context.read<ProductBloc>().add(CreateProductEvent(product));
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.item.name);
//     descriptionController = TextEditingController(text: widget.item.description);
//     priceController = TextEditingController(text: widget.item.price.toString());
//     imageController = TextEditingController(text: widget.item.image);
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     descriptionController.dispose();
//     priceController.dispose();
//     imageController.dispose();
//     super.dispose();
//   }

//   void _saveProduct() {
//     if (_formKey.currentState!.validate()) {
//       final product = Product(
//         id: 0, // or auto-generated
//         name: _nameController.text,
//         price: double.parse(_priceController.text),
//         description: _descriptionController.text,
//         image: _imageController.text,
//       );

//       context.read<ProductBloc>().add(CreateProductEvent(product));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text('Add Product'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _ImageInput(),
//               const SizedBox(height: 16),
//               _NameInput(),
//               const SizedBox(height: 16),
//               _CategoryInput(),
//               const SizedBox(height: 16),
//               _PriceInput(),
//               const SizedBox(height: 16),
//               _DescriptionInput(),
//               const SizedBox(height: 16),
//               _AddButton(),
//               const SizedBox(height: 16),
//               _DeleteButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// A widget for displaying an image input field.
//   ///
//   /// The image input field is a container with a light gray background and a
//   /// rounded corner. It contains an icon and a text.
//   ///
//   /// The icon is the image icon from the Material Design Icons library. The
//   /// text is "Upload Image" and is displayed with a font size of 16 and a
//   /// color of #58595A.
//   Widget _ImageInput() {
//     return Container(
//       height: 160,
//       width: 350,
//       decoration: BoxDecoration(
//         // The container has a light gray background.
//         color: const Color(0xFFF3F3F3),
//         // The container has a rounded corner with a radius of 16.
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Icon(
//             Icons.image,
//             size: 70,
//             color: Color.fromARGB(255, 88, 90, 92),
//           ),
//           const SizedBox(height: 6),
//           const Text(
//             'Upload Image',
//             style: TextStyle(
//               fontSize: 16,
//               color: Color.fromARGB(255, 88, 90, 92),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _NameInput() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Name',
//           style: TextStyle(
//             fontSize: 16,
//             color: Color.fromARGB(255, 88, 90, 92),
//           ),
//         ),
//         const SizedBox(height: 6),
//         TextField(
//           controller: nameController,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             hintText: 'Product Name',
//           ),
//         ),
//       ],
//     );
//   }

//   /// A widget for displaying a category input field.
//   ///
//   /// The category input field is a column with a text and a text field.
//   ///
//   /// The text is "Category" and is displayed with a font size of 16 and a
//   /// color of #58595A. The text field is used to enter the category of the
//   /// product.
//   Widget _CategoryInput() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Category',
//           style: TextStyle(
//             fontSize: 16,
//             color: Color.fromARGB(255, 88, 90, 92),
//           ),
//         ),
//         const SizedBox(height: 6),
//         TextField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             hintText: 'Category',
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _PriceInput() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Price',
//           style: TextStyle(
//             fontSize: 16,
//             color: Color.fromARGB(255, 88, 90, 92),
//           ),
//         ),
//         const SizedBox(height: 6),
//         TextField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             hintText: 'Price                                                       \$',
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _DescriptionInput() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Description',
//           style: TextStyle(
//             fontSize: 16,
//             color: Color.fromARGB(255, 88, 90, 92),
//           ),
//         ),
//         const SizedBox(height: 6),
//         TextField(
//           controller: descriptionController,
//           maxLines: 5,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             hintText: 'Description',
//           ),
//         ),
//       ],
//     );
//   }




