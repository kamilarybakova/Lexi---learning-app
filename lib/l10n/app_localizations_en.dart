// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Lexi';

  @override
  String get addWords => 'Add words';

  @override
  String get dictionary => 'Dictionary';

  @override
  String get emptyDictionaryTitle => 'Dictionary is empty';

  @override
  String get emptyDictionarySubtitle =>
      'Add your first words to start learning';

  @override
  String get searchHint => 'Search words';

  @override
  String get todayTraining => 'Today\'s training';

  @override
  String wordsWaiting(int count) {
    return '$count words waiting for you';
  }

  @override
  String get greetingMorning => 'Good morning ☀️';

  @override
  String get greetingAfternoon => 'Good afternoon 🌤️';

  @override
  String get greetingEvening => 'Good evening 🌅';

  @override
  String get greetingNight => 'Good night 🌙';

  @override
  String get dashboardSubtitle => 'Let\'s learn some words';

  @override
  String get todayProgress => 'Today\'s progress';

  @override
  String wordsLearned(int learned, int total) {
    return '$learned of $total words learned';
  }

  @override
  String get profile => 'Profile';

  @override
  String get language => 'Language';

  @override
  String get learning => 'Learning';

  @override
  String get learningGoal => 'Learning goal';

  @override
  String get goalTravel => 'Travel';

  @override
  String get learningLanguage => 'Learning language';

  @override
  String get notifications => 'Notifications';

  @override
  String get dailyReminder => 'Daily reminder';

  @override
  String get preferences => 'Preferences';

  @override
  String get pronunciation => 'Pronunciation';

  @override
  String get data => 'Data';

  @override
  String get exportWords => 'Export words';

  @override
  String get resetProgress => 'Reset progress';

  @override
  String get app => 'App';

  @override
  String get about => 'About app';

  @override
  String get authTitle => 'Sign in to add words';

  @override
  String get authSubtitle =>
      'Create an account to save your words,\nsync them between devices\nand use AI features.';

  @override
  String get authFeatureSync => 'Sync words between devices';

  @override
  String get authFeatureAI => 'AI translation and automatic categorization';

  @override
  String get authFeatureSecurity => 'Secure cloud storage';

  @override
  String get authGoogle => 'Continue with Google';

  @override
  String get authLater => 'Maybe later';

  @override
  String get scanFromPhoto => 'Scan from photo';

  @override
  String get addManually => 'Add manually';

  @override
  String get pasteText => 'Paste text';

  @override
  String get manualInputHint => 'Enter one or more words\n(each on a new line)';

  @override
  String get check => 'Check';

  @override
  String get detectedWords => 'Detected words';

  @override
  String get scanText => 'Scan';

  @override
  String get scan => 'Scan text';

  @override
  String get scanError => 'Scan error';

  @override
  String reviewWordsTitle(int count) {
    return 'Review words ($count)';
  }

  @override
  String addWordsButton(int count) {
    return 'Add $count words';
  }
}
