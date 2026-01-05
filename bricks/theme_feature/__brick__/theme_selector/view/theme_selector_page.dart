import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_example/theme_selector/theme_selector.dart';

/// {@template theme_selector_page}
/// Page for selecting app theme
/// {@endtemplate}
class ThemeSelectorPage extends StatelessWidget {
  /// {@macro theme_selector_page}
  const ThemeSelectorPage({super.key});

  /// Route for ThemeSelectorPage
  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const ThemeSelectorPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body: BlocBuilder<ThemeModeBloc, ThemeModeState>(
        builder: (context, state) {
          return ListView(
            children: [
              RadioListTile<ThemeMode>(
                title: const Text('System'),
                value: ThemeMode.system,
                groupValue: state.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<ThemeModeBloc>()
                        .add(ThemeModeChanged(value));
                  }
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Light'),
                value: ThemeMode.light,
                groupValue: state.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<ThemeModeBloc>()
                        .add(ThemeModeChanged(value));
                  }
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Dark'),
                value: ThemeMode.dark,
                groupValue: state.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<ThemeModeBloc>()
                        .add(ThemeModeChanged(value));
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
