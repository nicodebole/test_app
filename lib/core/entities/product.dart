import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/core/entities/rating.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject{
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String image;

  @HiveField(5)
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });
}
