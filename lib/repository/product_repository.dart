import 'dart:convert';
import '../model/Product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final String apiUrl;

  ProductRepository({required this.apiUrl});

  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(
      Uri.parse('$apiUrl/get_products/0')             
    );

    if (response.statusCode == 200) {
      final List<dynamic> products = jsonDecode(response.body)['products'];
      final List<ProductModel> productsList = products.map((product) => ProductModel.fromJson(product)).toList();
      return productsList;
    } else {
      throw Exception('Failed to load Products');            
    }
  }

}