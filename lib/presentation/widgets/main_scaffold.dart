import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/presentation/widgets/theme_toggle.dart';

class BottomItem {
  BottomItem({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.route,
  });

  final IconData selectedIcon;
  final IconData unselectedIcon;
  final String route;
}

class MainScaffold extends StatelessWidget {
  MainScaffold({
    super.key,
    required this.title,
    required this.selectedIndex,
    required this.child,
  });

  final String title;
  final int selectedIndex;
  final Widget child;

  final List<BottomItem> items = [
    BottomItem(
      selectedIcon: Icons.home,
      unselectedIcon: Icons.home_outlined,
      route: '/products',
    ),
    BottomItem(
      selectedIcon: Icons.search,
      unselectedIcon: Icons.search_outlined,
      route: '/search',
    ),
    BottomItem(
      selectedIcon: Icons.settings,
      unselectedIcon: Icons.settings_outlined,
      route: '/settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [ThemeToggle()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (value) {
          context.go(items[value].route);
        },
        items: List.generate(items.length, (index) {
          final item = items[index];
          return BottomNavigationBarItem(
            icon: Icon(item.unselectedIcon),
            label: "",
            activeIcon: ItemIcon(icon: Icon(item.selectedIcon)),
          );
        }),
      ),
      body: child,
    );
  }
}

class ItemIcon extends StatelessWidget {
  const ItemIcon({
    super.key,
    required this.icon,
  });

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 4),
        FadeIn(
          duration: const Duration(milliseconds: 300),
          child: CircleAvatar(
            radius: 2,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
