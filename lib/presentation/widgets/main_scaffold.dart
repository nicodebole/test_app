import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomItem {
  BottomItem({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.route,
    required this.title,
  });

  final IconData selectedIcon;
  final IconData unselectedIcon;
  final String route;
  final String title;
}

class MainScaffold extends StatelessWidget {
  MainScaffold({
    super.key,
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  final List<BottomItem> items = [
    BottomItem(
      selectedIcon: Icons.home,
      unselectedIcon: Icons.home_outlined,
      route: '/products',
      title: "Home",
    ),
    BottomItem(
      selectedIcon: Icons.settings,
      unselectedIcon: Icons.settings_outlined,
      route: '/settings',
      title: "Settings",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final index = items.indexWhere((element) => element.route == state.fullPath);
    final selectedItem = items[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedItem.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: index,
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
