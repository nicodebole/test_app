import 'package:flutter/material.dart';
import 'package:test_app/presentation/widgets/theme_toggle.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ThemeToggle(),
    );
  }
}
