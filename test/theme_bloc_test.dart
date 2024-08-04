import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test_app/presentation/blocs/theme/theme_bloc.dart';

void main() {
  group('ThemeBloc', () {
    late ThemeBloc themeBloc;

    setUp(() {
      themeBloc = ThemeBloc();
    });

    tearDown(() {
      themeBloc.close();
    });

    test('El estado inicial es LightThemeState', () {
      expect(themeBloc.state, isA<LightThemeState>());
    });

    blocTest<ThemeBloc, ThemeState>(
      'Se agrega el evento ToggleTheme. Estado esperado: DarkThemeState',
      build: () => themeBloc,
      act: (bloc) => bloc.add(ToggleTheme()),
      expect: () => [isA<DarkThemeState>()],
    );

    blocTest<ThemeBloc, ThemeState>(
      'Se agrega el evento ToggleTheme 2 veces. Estados esperados: [DarkThemeState y LightThemeState]',
      build: () => themeBloc,
      act: (bloc) {
        bloc.add(ToggleTheme());
        bloc.add(ToggleTheme());
      },
      expect: () => [isA<DarkThemeState>(), isA<LightThemeState>()],
    );
  });
}
