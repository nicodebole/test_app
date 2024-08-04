import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/entities/product.dart';
import 'package:test_app/presentation/blocs/product/product_bloc.dart';
import 'package:test_app/presentation/pages/product_detail.dart';
import 'package:test_app/presentation/widgets/loading.dart';
import 'package:test_app/presentation/widgets/product_card.dart';
import 'package:test_app/presentation/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Loading();
        } else if (state is ProductLoaded) {
          return ListView(
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Banner(),
              ),
              const SizedBox(height: 24),
              _TitleWidget(
                title: "New Arrival",
                titlePadding: const EdgeInsets.symmetric(horizontal: 16),
                child: ProductsCarousel(products: state.products),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _TitleWidget(
                  title: "Best seller",
                  child: ProductList(products: state.products),
                ),
              ),
            ],
          );
        } else if (state is ProductError) {
          return Text('Error: ${state.message}');
        } else {
          return const Text("INITIAL");
        }
      },
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.title,
    required this.child,
    this.titlePadding,
  });

  final String title;
  final Widget child;
  final EdgeInsetsGeometry? titlePadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: titlePadding ?? EdgeInsets.zero,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

class ProductsCarousel extends StatelessWidget {
  const ProductsCarousel({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (BuildContext context, int index) {
          return FadeInRight(
            child: SizedBox(
              width: 200,
              child: ProductCard(product: products[index]),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/publicity.jpg",
            fit: BoxFit.cover,
          ),
          const CustomGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black87,
              Colors.transparent,
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Special Sale\nup to 60%",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.2),
            ),
          )
        ],
      ),
    );
  }
}
