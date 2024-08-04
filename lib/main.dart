import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/core/entities/product.dart';
import 'package:test_app/core/entities/rating.dart';
import 'package:test_app/dependency_injection/dependency_injection.dart';
import 'package:test_app/presentation/blocs/theme/theme_bloc.dart';
import 'package:test_app/presentation/router/router.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  Hive
    ..registerAdapter(ProductAdapter())
    ..registerAdapter(RatingAdapter());

  await Hive.openBox<Product>('products');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DependencyInjection.provideProductBloc(),
        ),
        BlocProvider(
          create: (context) => DependencyInjection.provideProductByIdBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, state) {
          return MaterialApp.router(
            title: 'Test App',
            theme: state.themeData,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
