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
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        });
  }
}
