import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(state is LightThemeState ? AppLocalizations.of(context)!.lightMode : AppLocalizations.of(context)!.darkMode),
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
