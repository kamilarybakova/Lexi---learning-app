// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Lexi';

  @override
  String get addWords => 'Добавить слова';

  @override
  String get dictionary => 'Словарь';

  @override
  String get emptyDictionaryTitle => 'Словарь пуст';

  @override
  String get emptyDictionarySubtitle =>
      'Добавьте первые слова, чтобы начать обучение';

  @override
  String get searchHint => 'Поиск слов';

  @override
  String get todayTraining => 'Тренировка на сегодня';

  @override
  String wordsWaiting(int count) {
    return '$count слов ждут вас';
  }

  @override
  String get greetingMorning => 'Доброе утро ☀️';

  @override
  String get greetingAfternoon => 'Добрый день 🌤️';

  @override
  String get greetingEvening => 'Добрый вечер 🌅';

  @override
  String get greetingNight => 'Доброй ночи 🌙';

  @override
  String get dashboardSubtitle => 'Давайте учить слова';

  @override
  String get todayProgress => 'Прогресс сегодня';

  @override
  String wordsLearned(int learned, int total) {
    return '$learned из $total слов выучено';
  }

  @override
  String get profile => 'Профиль';

  @override
  String get language => 'Язык';

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
  String get scanFromPhoto => 'Сканировать с фото';

  @override
  String get addManually => 'Добавить вручную';

  @override
  String get pasteText => 'Вставить текст';

  @override
  String get manualInputHint =>
      'Введите одно или несколько слов\n(каждое с новой строки)';

  @override
  String get check => 'Проверить';

  @override
  String get detectedWords => 'Найденные слова';

  @override
  String get scanText => 'Сканировать';

  @override
  String get scan => 'Отсканируйте текст';

  @override
  String get scanError => 'Ошибка сканирования';

  @override
  String reviewWordsTitle(int count) {
    return 'Проверьте слова ($count)';
  }

  @override
  String addWordsButton(int count) {
    return 'Добавить $count слов';
  }
}
