part of 'theme_bloc.dart';

// ThemeData _baseTheme = ThemeData(
//   textTheme: GoogleFonts.plusJakartaSansTextTheme(),
//   // Añade aquí otras propiedades comunes
// );

abstract class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState(this.themeData);

  @override
  List<Object> get props => [themeData];
}

class LightThemeState extends ThemeState {
  LightThemeState()
      : super(
          ThemeData.light().copyWith(
            scaffoldBackgroundColor: const Color(0xFFF3F3F3),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF7D62ED),
            ),
          ),
        );
}

class DarkThemeState extends ThemeState {
  DarkThemeState()
      : super(
          ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color.fromARGB(255, 42, 42, 42),
            colorScheme: ColorScheme.fromSeed(
              // seedColor: const Color(0xFFDEFC54),
              seedColor: const Color(0xFF695ACD),
              brightness: Brightness.dark
            ),
          ),
        );
}
