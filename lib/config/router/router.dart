import 'package:go_router/go_router.dart';
import 'package:test_app/presentation/pages/home.dart';
import 'package:test_app/presentation/pages/product_detail.dart';
import 'package:test_app/presentation/pages/settings.dart';
import 'package:test_app/presentation/widgets/main_scaffold.dart';

final GoRouter router = GoRouter(
  initialLocation: '/products',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) {
        return MainScaffold(
          state: state,
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
              path: '/settings',
              builder: (context, state) => const SettingsPage(),
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
