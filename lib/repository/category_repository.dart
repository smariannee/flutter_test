import 'dart:convert';
import '../model/Category_model.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  final String apiUrl;
  final String accessToken;

  CategoryRepository({required this.apiUrl, required this.accessToken});

  Future<CategoryModel> getCategory(String id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/categories/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },        
    );

    if (response.statusCode == 200) {
      return CategoryModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load category');
    }
  }

}