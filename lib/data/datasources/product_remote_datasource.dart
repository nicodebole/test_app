import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductRemoteDataSource {
  final String apiUrl;

  ProductRemoteDataSource(this.apiUrl);

  Future<List<ProductModel>> getProducts() async {
    final response = await http.Client().get(Uri.parse('$apiUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ProductModel> getProductById(int id) async {
    final response = await http.Client().get(
        Uri.parse('$apiUrl/products/$id'));

    if (response.statusCode == 200) {
      final dynamic jsonResult = json.decode(response.body);
      return ProductModel.fromJson(jsonResult);
    } else {
      throw Exception('Failed to load product by id: ${response.body}');
    }
  }
}
