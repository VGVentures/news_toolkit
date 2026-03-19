import 'package:flutter/widgets.dart';
import 'package:{{project_name.snakeCase()}}/l10n/arb/app_localizations.dart';

export 'package:{{project_name.snakeCase()}}/l10n/arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
