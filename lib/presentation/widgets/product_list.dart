import 'package:flutter/material.dart';
import 'package:test_app/core/entities/product.dart';
import 'package:test_app/presentation/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 10.0, // spacing between rows
          crossAxisSpacing: 10.0, // spacing between columns
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        });
  }
}
