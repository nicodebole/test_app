part of 'theme_bloc.dart';

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
              seedColor: Colors.deepPurple,
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
              seedColor: Colors.deepOrange,
              brightness: Brightness.dark,
            ),
          ),
        );
}
