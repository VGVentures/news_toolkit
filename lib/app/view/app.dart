import 'package:app_ui/app_ui.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_news_template/app/app.dart';
import 'package:google_news_template/l10n/l10n.dart';
import 'package:google_news_template/login/login.dart';
import 'package:google_news_template/theme_selector/theme_selector.dart';
import 'package:news_repository/news_repository.dart';
import 'package:notifications_repository/notifications_repository.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required UserRepository userRepository,
    required NewsRepository newsRepository,
    required NotificationsRepository notificationsRepository,
    required User user,
  })  : _userRepository = userRepository,
        _newsRepository = newsRepository,
        _notificationsRepository = notificationsRepository,
        _user = user;
  final UserRepository _userRepository;
  final NewsRepository _newsRepository;
  final NotificationsRepository _notificationsRepository;
  final User _user;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _userRepository),
        RepositoryProvider.value(value: _newsRepository),
        RepositoryProvider.value(value: _notificationsRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              userRepository: _userRepository,
              notificationsRepository: _notificationsRepository,
              user: _user,
            ),
          ),
          BlocProvider(create: (_) => ThemeModeBloc()),
          BlocProvider(
            create: (_) => LoginWithEmailLinkBloc(
              userRepository: _userRepository,
            ),
            lazy: false,
          )
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      darkTheme: const AppDarkTheme().themeData,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
