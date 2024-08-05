import 'package:flutter/material.dart';
import 'package:test_app/core/entities/rating.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rating,
  });

  final Rating rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${rating.rate}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 2),
        Icon(
          Icons.star,
          size: 18,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 2),
        Text("(${rating.count})"),
      ],
    );
  }
}
