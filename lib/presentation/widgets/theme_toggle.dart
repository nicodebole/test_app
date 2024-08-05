import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/blocs/theme/theme_bloc.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(state is LightThemeState ? "Light mode" : "Dark mode"),
            IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ToggleTheme());
              },
              icon: Icon(
                state is DarkThemeState ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
          ],
        );
      },
    );
  }
}
