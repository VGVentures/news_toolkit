part of 'theme_mode_bloc.dart';

/// Base class for theme mode events
abstract class ThemeModeEvent extends Equatable {
  const ThemeModeEvent();

  @override
  List<Object> get props => [];
}

/// Event to change theme mode
class ThemeModeChanged extends ThemeModeEvent {
  /// Creates a [ThemeModeChanged] event
  const ThemeModeChanged(this.themeMode);

  /// The new theme mode
  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];
}
