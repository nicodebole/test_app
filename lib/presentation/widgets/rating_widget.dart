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
      children: [
        SizedBox(
          height: 20,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(5, (index) {
              return Icon(
                index + 1 <= rating.rate ? Icons.star : Icons.star_outline,
                size: 20,
              );
            }),
          ),
        ),
        const SizedBox(width: 5),
        Text("(${rating.count})"),
      ],
    );
  }
}
