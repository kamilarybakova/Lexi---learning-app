// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kirghiz Kyrgyz (`ky`).
class AppLocalizationsKy extends AppLocalizations {
  AppLocalizationsKy([String locale = 'ky']) : super(locale);

  @override
  String get appTitle => 'Lexi';

  @override
  String get addWords => 'Сөз кошуу';

  @override
  String get dictionary => 'Сөздүк';

  @override
  String get emptyDictionaryTitle => 'Сөздүк бош';

  @override
  String get emptyDictionarySubtitle =>
      'Үйрөнүүнү баштоо үчүн биринчи сөздөрдү кошуңуз';

  @override
  String get searchHint => 'Сөз издөө';

  @override
  String get todayTraining => 'Бүгүнкү машыгуу';

  @override
  String wordsWaiting(int count) {
    return '$count сөз сизди күтүп турат';
  }

  @override
  String get greetingMorning => 'Кутмандуу таң ☀️';

  @override
  String get greetingAfternoon => 'Кутмандуу күн 🌤️';

  @override
  String get greetingEvening => 'Кутмандуу кеч 🌅';

  @override
  String get greetingNight => 'Кутмандуу түн 🌙';

  @override
  String get dashboardSubtitle => 'Сөздөрдү үйрөнөлү';

  @override
  String get todayProgress => 'Бүгүнкү прогресс';

  @override
  String wordsLearned(int learned, int total) {
    return '$total ичинен $learned сөз үйрөнүлдү';
  }

  @override
  String get profile => 'Профиль';

  @override
  String get language => 'Тил';

  @override
  String get learning => 'Үйрөнүү';

  @override
  String get learningGoal => 'Үйрөнүү максаты';

  @override
  String get goalTravel => 'Саякат';

  @override
  String get learningLanguage => 'Үйрөнүү тили';

  @override
  String get notifications => 'Билдирмелер';

  @override
  String get dailyReminder => 'Күнүмдүк эскертүү';

  @override
  String get preferences => 'Жөндөөлөр';

  @override
  String get pronunciation => 'Айтылышы';

  @override
  String get data => 'Маалыматтар';

  @override
  String get exportWords => 'Сөздөрдү экспорттоо';

  @override
  String get resetProgress => 'Прогрессти башынан баштоо';

  @override
  String get app => 'Колдонмо';

  @override
  String get about => 'Колдонмо жөнүндө';

  @override
  String get authTitle => 'Сөз кошуу үчүн кириңиз';

  @override
  String get authSubtitle =>
      'Сөздөрдү сактоо,\nтүзмөктөр ортосунда синхрондоштуруу\nжана ИИ функцияларын колдонуу үчүн аккаунт түзүңүз.';

  @override
  String get authFeatureSync => 'Сөздөрдү түзмөктөр ортосунда синхрондоштуруу';

  @override
  String get authFeatureAI => 'ИИ аркылуу которуу жана автоматтык категориялоо';

  @override
  String get authFeatureSecurity => 'Коопсуз булут сактагыч';

  @override
  String get authGoogle => 'Google аркылуу кирүү';

  @override
  String get authLater => 'Кийинчерээк';

  @override
  String get scanFromPhoto => 'Сүрөттөн сканерлөө';

  @override
  String get addManually => 'Кол менен кошуу';

  @override
  String get pasteText => 'Текстти чаптоо';

  @override
  String get manualInputHint =>
      'Бир же бир нече сөз жазыңыз\n(ар бирин жаңы саптан)';

  @override
  String get check => 'Текшерүү';

  @override
  String get detectedWords => 'Табылган сөздөр';

  @override
  String get scanText => 'Сканерлөө';

  @override
  String get scan => 'Текстти сканерлеңиз';

  @override
  String get scanError => 'Сканерлөөдө ката кетти';

  @override
  String reviewWordsTitle(int count) {
    return 'Сөздөрдү текшерүү ($count)';
  }

  @override
  String addWordsButton(int count) {
    return '$count сөз кошуу';
  }
}
