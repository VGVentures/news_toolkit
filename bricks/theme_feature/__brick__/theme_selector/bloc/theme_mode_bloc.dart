import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

/// {@template theme_mode_bloc}
/// Manages app theme mode (light/dark/system)
/// Persists selection using HydratedBloc
/// {@endtemplate}
class ThemeModeBloc extends HydratedBloc<ThemeModeEvent, ThemeModeState> {
  /// {@macro theme_mode_bloc}
  ThemeModeBloc() : super(const ThemeModeState()) {
    on<ThemeModeChanged>(_onThemeModeChanged);
  }

  void _onThemeModeChanged(
    ThemeModeChanged event,
    Emitter<ThemeModeState> emit,
  ) {
    emit(ThemeModeState(themeMode: event.themeMode));
  }

  @override
  ThemeModeState? fromJson(Map<String, dynamic> json) {
    try {
      final themeModeIndex = json['themeMode'] as int?;
      if (themeModeIndex == null) return null;

      return ThemeModeState(
        themeMode: ThemeMode.values[themeModeIndex],
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeModeState state) {
    return {'themeMode': state.themeMode.index};
  }
}
