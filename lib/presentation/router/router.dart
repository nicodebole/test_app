import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/presentation/pages/home.dart';
import 'package:test_app/presentation/pages/product_detail.dart';
import 'package:test_app/presentation/widgets/main_scaffold.dart';

final GoRouter router = GoRouter(
  initialLocation: '/products',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) {
        late final String title;
        late final int selectedIndex;
        final route = state.fullPath?.split("/").last;
        switch (route) {
          case "products":
            title = "Home";
            selectedIndex = 0;
            break;
          case "search":
            title = "Search";
            selectedIndex = 1;
            break;
          case "settings":
            title = "settings";
            selectedIndex = 2;
            break;
          default:
        }
        return MainScaffold(
          title: title,
          selectedIndex: selectedIndex,
          child: child,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/products',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const Center(
                child: Text("SEARCH"),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const Center(
                child: Text("SETTINGS"),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/products/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id'] ?? "");
        return ProductDetailPage(id: id);
      },
    ),
  ],
);
