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
      'Öğrenmeye başlamak için ilk kelimelerinizi ekleyin';

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
  String get learning => 'Öğrenme';

  @override
  String get learningGoal => 'Öğrenme hedefi';

  @override
  String get goalTravel => 'Seyahat';

  @override
  String get learningLanguage => 'Öğrenme dili';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get dailyReminder => 'Günlük hatırlatma';

  @override
  String get preferences => 'Ayarlar';

  @override
  String get pronunciation => 'Telaffuz';

  @override
  String get data => 'Veriler';

  @override
  String get exportWords => 'Kelimeleri dışa aktar';

  @override
  String get resetProgress => 'İlerlemeyi sıfırla';

  @override
  String get app => 'Uygulama';

  @override
  String get about => 'Uygulama hakkında';

  @override
  String get authTitle => 'Kelime eklemek için giriş yapın';

  @override
  String get authSubtitle =>
      'Kelimeleri kaydetmek,\ncihazlar arasında senkronize etmek\nve yapay zeka özelliklerini kullanmak için hesap oluşturun.';

  @override
  String get authFeatureSync => 'Kelimeleri cihazlar arasında senkronize etme';

  @override
  String get authFeatureAI =>
      'Yapay zeka ile çeviri ve otomatik kategorilendirme';

  @override
  String get authFeatureSecurity => 'Güvenli bulut depolama';

  @override
  String get authGoogle => 'Google ile giriş yap';

  @override
  String get authLater => 'Daha sonra';

  @override
  String get scanFromPhoto => 'Fotoğraftan tara';

  @override
  String get addManually => 'Manuel olarak ekle';

  @override
  String get pasteText => 'Metni yapıştır';

  @override
  String get manualInputHint =>
      'Bir veya daha fazla kelime girin\n(her biri yeni satırda)';

  @override
  String get check => 'Kontrol et';

  @override
  String get detectedWords => 'Bulunan kelimeler';

  @override
  String get scanText => 'Tara';

  @override
  String get scan => 'Metni tarayın';

  @override
  String get scanError => 'Tarama hatası';

  @override
  String reviewWordsTitle(int count) {
    return 'Kelimeleri gözden geçir ($count)';
  }

  @override
  String addWordsButton(int count) {
    return '$count kelime ekle';
  }
}
