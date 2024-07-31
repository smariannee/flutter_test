import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/repository/Product_repository.dart';
import 'package:flutter_application_2/presentation/pages/product_page.dart';

void main() {
  final ProductRepository productRepository = ProductRepository(apiUrl: 'https://afzd4wkj63.execute-api.us-east-2.amazonaws.com/Prod');

  runApp(
    RepositoryProvider<ProductRepository>(
      create: (context) => productRepository,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      home: ProductPage(),
    );
  }
}
