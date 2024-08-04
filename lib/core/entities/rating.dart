import 'package:hive_flutter/hive_flutter.dart';

part 'rating.g.dart';

@HiveType(typeId: 1)
class Rating extends HiveObject{
  @HiveField(0)
  final double rate;

  @HiveField(1)
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });
}
