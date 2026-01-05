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
  String get addWords => 'Add Words';

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
  String get todayTraining => 'Today\'s Training';

  @override
  String wordsWaiting(int count) {
    return '$count words waiting for you';
  }

  @override
  String get greetingMorning => 'Good Morning ☀️';

  @override
  String get greetingAfternoon => 'Good Afternoon 🌤️';

  @override
  String get greetingEvening => 'Good Evening 🌅';

  @override
  String get greetingNight => 'Good Night 🌙';

  @override
  String get dashboardSubtitle => 'Let\'s learn some words';

  @override
  String get todayProgress => 'Today\'s Progress';

  @override
  String wordsLearned(int learned, int total) {
    return '$learned of $total words learned';
  }

  @override
  String get profile => 'Profile';

  @override
  String get language => 'Language';

  @override
  String get learning => 'Обучение';

  @override
  String get learningGoal => 'Цель обучения';

  @override
  String get goalTravel => 'Путешествия';

  @override
  String get learningLanguage => 'Язык обучения';

  @override
  String get notifications => 'Уведомления';

  @override
  String get dailyReminder => 'Ежедневное напоминание';

  @override
  String get preferences => 'Настройки';

  @override
  String get pronunciation => 'Произношение';

  @override
  String get data => 'Данные';

  @override
  String get exportWords => 'Экспорт слов';

  @override
  String get resetProgress => 'Сбросить прогресс';

  @override
  String get app => 'Приложение';

  @override
  String get about => 'О приложении';

  @override
  String get authTitle => 'Войдите, чтобы добавлять слова';

  @override
  String get authSubtitle =>
      'Создайте аккаунт, чтобы сохранять слова,\nсинхронизировать их между устройствами\nи использовать ИИ-функции.';

  @override
  String get authFeatureSync => 'Синхронизация слов между устройствами';

  @override
  String get authFeatureAI => 'ИИ-перевод и автоматическая категоризация';

  @override
  String get authFeatureSecurity => 'Безопасное облачное хранилище';

  @override
  String get authGoogle => 'Войти через Google';

  @override
  String get authLater => 'Позже';

  @override
  String get scanFromPhoto => 'Scan from photo';

  @override
  String get addManually => 'Add manually';

  @override
  String get pasteText => 'Paste text';

  @override
  String get manualInputHint =>
      'Введите одно или несколько слов\n(каждое с новой строки)';

  @override
  String get check => 'Проверить';

  @override
  String get detectedWords => 'Найденные слова';
}
