import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// The name of this application
  ///
  /// In en, this message translates to:
  /// **'Flutter News Example'**
  String get appName;

  /// Message shown when there is an error at login
  ///
  /// In en, this message translates to:
  /// **'Authentication failure'**
  String get authenticationFailure;

  /// Text displayed when an unexpected error occurs
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get unexpectedFailure;

  /// Text displayed when a share error occurs
  ///
  /// In en, this message translates to:
  /// **'Problem sharing your content. Please try again.'**
  String get shareFailure;

  /// Text displayed when loading an ad fails
  ///
  /// In en, this message translates to:
  /// **'Failed to load this ad.'**
  String get adLoadFailure;

  /// Greeting shown on the login page.
  ///
  /// In en, this message translates to:
  /// **'Welcome to\nFlutter News Example'**
  String get loginWelcomeText;

  /// Login Button Text
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get loginButtonText;

  /// Header title shown on Login with email form
  ///
  /// In en, this message translates to:
  /// **'Please enter your\nemail address.'**
  String get loginWithEmailHeaderText;

  /// Hint text shown on the email text field on Login with email form
  ///
  /// In en, this message translates to:
  /// **'Your email address'**
  String get loginWithEmailTextFieldHint;

  /// Subtitle shown on Login with email form
  ///
  /// In en, this message translates to:
  /// **'By logging in, you agree to our '**
  String get loginWithEmailSubtitleText;

  /// Text terms and privacy policy shown on Login with email form
  ///
  /// In en, this message translates to:
  /// **'Terms of Use and Privacy Policy'**
  String get loginWithEmailTermsAndPrivacyPolicyText;

  /// Message shown when there is an error creating an account
  ///
  /// In en, this message translates to:
  /// **'Unable to create an account'**
  String get loginWithEmailFailure;

  /// Title shown on the TOS modal
  ///
  /// In en, this message translates to:
  /// **'Terms of Use &\nPrivacy Policy'**
  String get termsOfServiceModalTitle;

  /// Log in with email button text shown on the log in modal
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get loginWithEmailButtonText;

  /// The option to use system-wide theme in the theme selector menu
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemOption;

  /// The option for light mode in the theme selector menu
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightModeOption;

  /// The option for dark mode in the theme selector menu
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkModeOption;

  /// Text shown as title on the onboarding page
  ///
  /// In en, this message translates to:
  /// **'Welcome to\nThe Daily Globe!'**
  String get onboardingWelcomeTitle;

  /// Text shown as subtitle on the onboarding page
  ///
  /// In en, this message translates to:
  /// **'Please set your preferences to\nget the app up and running.'**
  String get onboardingSubtitle;

  /// Text of the first number page in the onboarding.
  ///
  /// In en, this message translates to:
  /// **'1 OF 2'**
  String get onboardingItemFirstNumberTitle;

  /// Text of the second number page in the onboarding.
  ///
  /// In en, this message translates to:
  /// **'2 OF 2'**
  String get onboardingItemSecondNumberTitle;

  /// Text of the first page title of the onboarding.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR TITLE FOR\nAD TRACKING PERMISSIONS'**
  String get onboardingItemFirstTitle;

  /// Text of the first page subtitle of the onboarding.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR DESCRIPTION FOR\nAD TRACKING PERMISSIONS'**
  String get onboardingItemFirstSubtitleTitle;

  /// Text of the primary button on the first page of the onboarding.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR CALL TO ACTION'**
  String get onboardingItemFirstButtonTitle;

  /// Text of the primary title on the second page of the onboarding.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR TITLE FOR\nNOTIFICATION PERMISSIONS'**
  String get onboardingItemSecondTitle;

  /// Text of the second page subtitle of the onboarding.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR DESCRIPTION FOR\nNOTIFICATION PERMISSIONS'**
  String get onboardingItemSecondSubtitleTitle;

  /// Text of the primary button on the second page of the onboarding.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR CALL TO ACTION'**
  String get onboardingItemSecondButtonTitle;

  /// Text of the secondary button of the onboarding.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR DECLINE TEXT'**
  String get onboardingItemSecondaryButtonTitle;

  /// Tooltip shown on the login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTooltip;

  /// Tooltip shown on the open profile button
  ///
  /// In en, this message translates to:
  /// **'Open profile'**
  String get openProfileTooltip;

  /// Log in modal title
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get loginModalTitle;

  /// Log in modal subtitle
  ///
  /// In en, this message translates to:
  /// **'Log in to access articles and save\nyour preferences.'**
  String get loginModalSubtitle;

  /// Continue with email button text shown on the log in modal
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get continueWithEmailButtonText;

  /// Navigation drawer sections title
  ///
  /// In en, this message translates to:
  /// **'SECTIONS'**
  String get navigationDrawerSectionsTitle;

  /// Navigation drawer subscribe title
  ///
  /// In en, this message translates to:
  /// **'Become A Subscriber'**
  String get navigationDrawerSubscribeTitle;

  /// Navigation drawer subscribe subtitle
  ///
  /// In en, this message translates to:
  /// **'Subscribe to access premium content and exclusive online events.'**
  String get navigationDrawerSubscribeSubtitle;

  /// Subscribe button text
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribeButtonText;

  /// Log in with email next button shown on the login with email form
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButtonText;

  /// User profile page title
  ///
  /// In en, this message translates to:
  /// **'Your Info'**
  String get userProfileTitle;

  /// User profile logout button text
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get userProfileLogoutButtonText;

  /// User profile settings section subtitle
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get userProfileSettingsSubtitle;

  /// User profile subscription details section subtitle
  ///
  /// In en, this message translates to:
  /// **'Subscription Details'**
  String get userProfileSubscriptionDetailsSubtitle;

  /// User profile not a subscriber subtitle
  ///
  /// In en, this message translates to:
  /// **'You are not currently a subscriber.'**
  String get userProfileSubscribeBoxSubtitle;

  /// User profile not a subscriber message
  ///
  /// In en, this message translates to:
  /// **'Become a subscriber to access premium content and exclusive online events.'**
  String get userProfileSubscribeBoxMessage;

  /// User profile settings subscribe button text
  ///
  /// In en, this message translates to:
  /// **'Subscribe Now'**
  String get userProfileSubscribeNowButtonText;

  /// Manage subscription section - subscription item title
  ///
  /// In en, this message translates to:
  /// **'Manage Subscription'**
  String get manageSubscriptionTile;

  /// Manage subscription section - subscription body text
  ///
  /// In en, this message translates to:
  /// **'Manage your subscription through the Subscriptions manager on your device.'**
  String get manageSubscriptionBodyText;

  /// Manage subscription link text
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get manageSubscriptionLinkText;

  /// User profile settings section - notifications item title
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get userProfileSettingsNotificationsTitle;

  /// User profile settings section - notification preferences item title
  ///
  /// In en, this message translates to:
  /// **'Notification Preferences'**
  String get notificationPreferencesTitle;

  /// User profile settings categories notifications subtitle
  ///
  /// In en, this message translates to:
  /// **'Notifications will be sent for all active categories below.'**
  String get notificationPreferencesCategoriesSubtitle;

  /// User profile legal section subtitle
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get userProfileLegalSubtitle;

  /// User profile legal section - terms of use and privacy policy item title
  ///
  /// In en, this message translates to:
  /// **'Terms of Use & Privacy Policy'**
  String get userProfileLegalTermsOfUseAndPrivacyPolicyTitle;

  /// User profile legal section - about item title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get userProfileLegalAboutTitle;

  /// User profile checkbox on title
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get checkboxOnTitle;

  /// User profile checkbox off title
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get userProfileCheckboxOffTitle;

  /// Header title shown in the magic link prompt UI
  ///
  /// In en, this message translates to:
  /// **'Check your email!'**
  String get magicLinkPromptHeader;

  /// Title shown in the magic link prompt UI
  ///
  /// In en, this message translates to:
  /// **'We sent an email to'**
  String get magicLinkPromptTitle;

  /// Subtitle shown in the magic link prompt UI
  ///
  /// In en, this message translates to:
  /// **'It contains a special link. Click it to\ncomplete the log in process.'**
  String get magicLinkPromptSubtitle;

  /// Open mail app button text shown in the magic link prompt UI
  ///
  /// In en, this message translates to:
  /// **'Open Mail App'**
  String get openMailAppButtonText;

  /// Premium text shown on the news block widgets
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get newsBlockPremiumText;

  /// Share text shown on the news block widgets and article page
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareText;

  /// Subscribe header shown in subscribe box
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR EMAIL SIGNUP PROMPT TITLE'**
  String get subscribeEmailHeader;

  /// Text shown as a hint in subscribe email text field
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get subscribeEmailHint;

  /// Subscribe body shown in subscribe box
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR EMAIL SIGNUP PROMPT DESCRIPTION'**
  String get subscribeEmailBody;

  /// Text shown in a button of a subscribe box
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR CALL TO ACTION'**
  String get subscribeEmailButtonText;

  /// Subscribe successful header shown in subscribe box
  ///
  /// In en, this message translates to:
  /// **'Thank you for signing up!'**
  String get subscribeSuccessfulHeader;

  /// Subscribe body shown in subscribe box
  ///
  /// In en, this message translates to:
  /// **'Check your email for all of your newsletter details. '**
  String get subscribeSuccessfulEmailBody;

  /// Message displayed when error ocurred during subscribing to newsletter
  ///
  /// In en, this message translates to:
  /// **'Problem ocurred when subscribing to the newsletter'**
  String get subscribeErrorMessage;

  /// Text displayed at the top of the popular searches.
  ///
  /// In en, this message translates to:
  /// **'Popular Searches'**
  String get searchPopularSearches;

  /// Text displayed at the top of the popular articles.
  ///
  /// In en, this message translates to:
  /// **'Popular Articles'**
  String get searchPopularArticles;

  /// Text displayed at the top of the relevant search.
  ///
  /// In en, this message translates to:
  /// **'Relevant Topics / Sections'**
  String get searchRelevantTopics;

  /// Text displayed at the top of the relevant articles.
  ///
  /// In en, this message translates to:
  /// **'Relevant Articles'**
  String get searchRelevantArticles;

  /// Hint displayed in search text field.
  ///
  /// In en, this message translates to:
  /// **'Search by keyword'**
  String get searchByKeyword;

  /// Message displayed when error occurred during fetching search results.
  ///
  /// In en, this message translates to:
  /// **'Problem ocurred finding search results.'**
  String get searchErrorMessage;

  /// Top stories text shown in the bottom nav bar widget.
  ///
  /// In en, this message translates to:
  /// **'Top Stories'**
  String get bottomNavBarTopStories;

  /// Search text shown in the bottom nav bar widget.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get bottomNavBarSearch;

  /// Header text shown in the bottom of article content.
  ///
  /// In en, this message translates to:
  /// **'Related Stories'**
  String get relatedStories;

  /// Title text shown in the subscribe modal widget.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR SUBSCRIPTION\nPROMPT TITLE'**
  String get subscribeModalTitle;

  /// Subtitle text shown in the subscribe modal widget.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR SUBSCRIPTION\nPROMPT DESCRIPTION'**
  String get subscribeModalSubtitle;

  /// Text shown in log in button on the subscribe modal widget.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get subscribeModalLogInButton;

  /// Title text shown in the subscribe limit modal widget.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached your\n4 article limit.'**
  String get subscribeWithArticleLimitModalTitle;

  /// Subtitle text shown in the subscribe limit modal modal widget.
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR SUBSCRIPTION\nPROMPT DESCRIPTION'**
  String get subscribeWithArticleLimitModalSubtitle;

  /// Text shown in log in button on the subscribe limit modal widget.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get subscribeWithArticleLimitModalLogInButton;

  /// Text shown in watch video button on the subscribe limit modal widget.
  ///
  /// In en, this message translates to:
  /// **'Watch a video to view this article'**
  String get subscribeWithArticleLimitModalWatchVideoButton;

  /// Header text shown in the bottom of article content above comment entry field.
  ///
  /// In en, this message translates to:
  /// **'Discussion'**
  String get discussion;

  /// Text shown inside comment entry text field.
  ///
  /// In en, this message translates to:
  /// **'Enter comment'**
  String get commentEntryHint;

  /// Title shown in the header of trending story article.
  ///
  /// In en, this message translates to:
  /// **'TRENDING STORY'**
  String get trendingStoryTitle;

  /// Text shown in the title of the subscription purchase overlay.
  ///
  /// In en, this message translates to:
  /// **'Subscribe today!'**
  String get subscriptionPurchaseTitle;

  /// Text shown bellow the title of the subscription purchase overlay.
  ///
  /// In en, this message translates to:
  /// **'Become a subscriber to access premium content and exclusive online events.'**
  String get subscriptionPurchaseSubtitle;

  /// Text shown as a header for subscription benefits.
  ///
  /// In en, this message translates to:
  /// **'Benefits'**
  String get subscriptionPurchaseBenefits;

  /// Text shown bellow the subscription benefits.
  ///
  /// In en, this message translates to:
  /// **'Cancel Anytime'**
  String get subscriptionPurchaseCancelAnytime;

  /// Text shown in button on subscription purchase overlay.
  ///
  /// In en, this message translates to:
  /// **'Start Free Trial'**
  String get subscriptionPurchaseButton;

  /// Text shown in button on subscription purchase overlay when user is unauthenticated.
  ///
  /// In en, this message translates to:
  /// **'Log in to subscribe'**
  String get subscriptionUnauthenticatedPurchaseButton;

  /// Text shown in unimplemented button on subscription purchase overlay.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get subscriptionViewDetailsButton;

  /// Text shown when clicked on view details button.
  ///
  /// In en, this message translates to:
  /// **'Configure additional subscription packages.'**
  String get subscriptionViewDetailsButtonSnackBar;

  /// Text shown subscription purchase was completed.
  ///
  /// In en, this message translates to:
  /// **'Purchase completed!'**
  String get subscriptionPurchaseCompleted;

  /// Text displayed where month abbreviation is used.
  ///
  /// In en, this message translates to:
  /// **'mo'**
  String get monthAbbreviation;

  /// Text displayed where year abbreviation is used.
  ///
  /// In en, this message translates to:
  /// **'yr'**
  String get yearAbbreviation;

  /// Slideshow text shown on slideshow introduction widgets.
  ///
  /// In en, this message translates to:
  /// **'Slideshow'**
  String get slideshow;

  /// Text displayed on the number of pages in the slideshow page.
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get slideshow_of_title;

  /// Text displayed when a network error occurs.
  ///
  /// In en, this message translates to:
  /// **'A network error has occured.\nCheck your connection and try again.'**
  String get networkError;

  /// Text displayed on the refresh button when a network error occurs.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get networkErrorButton;

  /// Delete account dialog cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get deleteAccountDialogCancelButtonText;

  /// Delete account dialog subtitle
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR DELETE DIALOG SUBTITLE'**
  String get deleteAccountDialogSubtitle;

  /// Delete account dialog title
  ///
  /// In en, this message translates to:
  /// **'ADD YOUR DELETE DIALOG TITLE'**
  String get deleteAccountDialogTitle;

  /// User profile delete account button title
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get userProfileDeleteAccountButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
