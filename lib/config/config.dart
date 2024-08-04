import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get productsApiUrl => dotenv.env['PRODUCTS_BASE_URL'] ?? '';
  static String get jsonplaceholderApiUrl => dotenv.env['JSONPLACEHOLDER_BASE_URL'] ?? '';
}