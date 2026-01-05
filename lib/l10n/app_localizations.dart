import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ky.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ky'),
    Locale('ru'),
    Locale('tr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Lexi'**
  String get appTitle;

  /// No description provided for @addWords.
  ///
  /// In en, this message translates to:
  /// **'Add Words'**
  String get addWords;

  /// No description provided for @dictionary.
  ///
  /// In en, this message translates to:
  /// **'Dictionary'**
  String get dictionary;

  /// No description provided for @emptyDictionaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Dictionary is empty'**
  String get emptyDictionaryTitle;

  /// No description provided for @emptyDictionarySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your first words to start learning'**
  String get emptyDictionarySubtitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search words'**
  String get searchHint;

  /// No description provided for @todayTraining.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Training'**
  String get todayTraining;

  /// Number of words waiting for training
  ///
  /// In en, this message translates to:
  /// **'{count} words waiting for you'**
  String wordsWaiting(int count);

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning ☀️'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon 🌤️'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening 🌅'**
  String get greetingEvening;

  /// No description provided for @greetingNight.
  ///
  /// In en, this message translates to:
  /// **'Good Night 🌙'**
  String get greetingNight;

  /// No description provided for @dashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s learn some words'**
  String get dashboardSubtitle;

  /// No description provided for @todayProgress.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Progress'**
  String get todayProgress;

  /// Progress of learned words
  ///
  /// In en, this message translates to:
  /// **'{learned} of {total} words learned'**
  String wordsLearned(int learned, int total);

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @learning.
  ///
  /// In en, this message translates to:
  /// **'Обучение'**
  String get learning;

  /// No description provided for @learningGoal.
  ///
  /// In en, this message translates to:
  /// **'Цель обучения'**
  String get learningGoal;

  /// No description provided for @goalTravel.
  ///
  /// In en, this message translates to:
  /// **'Путешествия'**
  String get goalTravel;

  /// No description provided for @learningLanguage.
  ///
  /// In en, this message translates to:
  /// **'Язык обучения'**
  String get learningLanguage;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Уведомления'**
  String get notifications;

  /// No description provided for @dailyReminder.
  ///
  /// In en, this message translates to:
  /// **'Ежедневное напоминание'**
  String get dailyReminder;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Настройки'**
  String get preferences;

  /// No description provided for @pronunciation.
  ///
  /// In en, this message translates to:
  /// **'Произношение'**
  String get pronunciation;

  /// No description provided for @data.
  ///
  /// In en, this message translates to:
  /// **'Данные'**
  String get data;

  /// No description provided for @exportWords.
  ///
  /// In en, this message translates to:
  /// **'Экспорт слов'**
  String get exportWords;

  /// No description provided for @resetProgress.
  ///
  /// In en, this message translates to:
  /// **'Сбросить прогресс'**
  String get resetProgress;

  /// No description provided for @app.
  ///
  /// In en, this message translates to:
  /// **'Приложение'**
  String get app;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'О приложении'**
  String get about;

  /// No description provided for @authTitle.
  ///
  /// In en, this message translates to:
  /// **'Войдите, чтобы добавлять слова'**
  String get authTitle;

  /// No description provided for @authSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Создайте аккаунт, чтобы сохранять слова,\nсинхронизировать их между устройствами\nи использовать ИИ-функции.'**
  String get authSubtitle;

  /// No description provided for @authFeatureSync.
  ///
  /// In en, this message translates to:
  /// **'Синхронизация слов между устройствами'**
  String get authFeatureSync;

  /// No description provided for @authFeatureAI.
  ///
  /// In en, this message translates to:
  /// **'ИИ-перевод и автоматическая категоризация'**
  String get authFeatureAI;

  /// No description provided for @authFeatureSecurity.
  ///
  /// In en, this message translates to:
  /// **'Безопасное облачное хранилище'**
  String get authFeatureSecurity;

  /// No description provided for @authGoogle.
  ///
  /// In en, this message translates to:
  /// **'Войти через Google'**
  String get authGoogle;

  /// No description provided for @authLater.
  ///
  /// In en, this message translates to:
  /// **'Позже'**
  String get authLater;

  /// No description provided for @scanFromPhoto.
  ///
  /// In en, this message translates to:
  /// **'Scan from photo'**
  String get scanFromPhoto;

  /// No description provided for @addManually.
  ///
  /// In en, this message translates to:
  /// **'Add manually'**
  String get addManually;

  /// No description provided for @pasteText.
  ///
  /// In en, this message translates to:
  /// **'Paste text'**
  String get pasteText;

  /// No description provided for @manualInputHint.
  ///
  /// In en, this message translates to:
  /// **'Введите одно или несколько слов\n(каждое с новой строки)'**
  String get manualInputHint;

  /// No description provided for @check.
  ///
  /// In en, this message translates to:
  /// **'Проверить'**
  String get check;

  /// No description provided for @detectedWords.
  ///
  /// In en, this message translates to:
  /// **'Найденные слова'**
  String get detectedWords;
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
      <String>['en', 'ky', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ky':
      return AppLocalizationsKy();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
