part of 'theme_mode_bloc.dart';

/// {@template theme_mode_state}
/// State for theme mode selection
/// {@endtemplate}
class ThemeModeState extends Equatable {
  /// {@macro theme_mode_state}
  const ThemeModeState({
    this.themeMode = ThemeMode.system,
  });

  /// Current theme mode
  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];
}
