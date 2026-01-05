// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Lexi';

  @override
  String get addWords => 'Kelime ekle';

  @override
  String get dictionary => 'Sözlük';

  @override
  String get emptyDictionaryTitle => 'Sözlük boş';

  @override
  String get emptyDictionarySubtitle =>
      'Öğrenmeye başlamak için ilk kelimeleri ekleyin';

  @override
  String get searchHint => 'Kelime ara';

  @override
  String get todayTraining => 'Bugünkü çalışma';

  @override
  String wordsWaiting(int count) {
    return '$count kelime sizi bekliyor';
  }

  @override
  String get greetingMorning => 'Günaydın ☀️';

  @override
  String get greetingAfternoon => 'İyi günler 🌤️';

  @override
  String get greetingEvening => 'İyi akşamlar 🌅';

  @override
  String get greetingNight => 'İyi geceler 🌙';

  @override
  String get dashboardSubtitle => 'Kelime öğrenelim';

  @override
  String get todayProgress => 'Bugünkü ilerleme';

  @override
  String wordsLearned(int learned, int total) {
    return '$total kelimeden $learned tanesi öğrenildi';
  }

  @override
  String get profile => 'Profil';

  @override
  String get language => 'Dil';

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
