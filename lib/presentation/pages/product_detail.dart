import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/entities/product.dart';
import 'package:test_app/presentation/blocs/product_by_id/product_by_id_bloc.dart';
import 'package:test_app/presentation/widgets/loading.dart';
import 'package:test_app/presentation/widgets/rating_widget.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductByIdBloc>().add(LoadProductById(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductByIdBloc, ProductByIdState>(
      builder: (context, state) {
        if (state is ProductByIdLoading) {
          return const Scaffold(
            body: Loading(),
          );
        }
    
        if (state is ProductByIdLoaded) {
          final product = state.product;
          return Scaffold(
            body: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                _CustomSliverAppBar(product: product),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _ProductDetails(product: product),
                    childCount: 1,
                  ),
                ),
              ],
            ),
          );
        }
    
        return const Scaffold(
          body: Placeholder(),
        );
      },
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   product.title,
            //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 16),
            Text.rich(
              TextSpan(children: [
                const TextSpan(
                  text: "Description:\n",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: product.description,
                ),
                TextSpan(
                  text: product.description,
                ),
                TextSpan(
                  text: product.description,
                ),
              ]),
            ),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(children: [
                const TextSpan(
                  text: "Description:\n",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: product.description,
                ),
                TextSpan(
                  text: product.description,
                ),
                TextSpan(
                  text: product.description,
                ),
              ]),
            ),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(children: [
                const TextSpan(
                  text: "Description:\n",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: product.description,
                ),
                TextSpan(
                  text: product.description,
                ),
                TextSpan(
                  text: product.description,
                ),
              ]),
            ),
            const SizedBox(height: 32),
            Text(
              "\$${(product.price.toStringAsFixed(2))}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 16),
            RatingWidget(rating: product.rating),
          ],
        ),
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  const _CustomSliverAppBar({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.4,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        centerTitle: true,
        title: Text(
          product.title,
          style: const TextStyle(
            fontSize: 20,
          ),
          // textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();

                  return FadeIn(child: child);
                },
              ),
            ),
            const CustomGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black87,
              ],
              stops: [
                0.8,
                1.0,
              ],
            ),
            const CustomGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black87,
                Colors.transparent,
              ],
              stops: [
                0.0,
                0.3,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomGradient extends StatelessWidget {
  const CustomGradient({super.key, 
    required this.begin,
    required this.end,
    required this.colors,
    this.stops,
  });

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color> colors;
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: begin,
            end: end,
          ),
        ),
      ),
    );
  }
}
