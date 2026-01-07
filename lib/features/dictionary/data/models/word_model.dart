import '../../domain/entities/word.dart';

class WordModel extends Word {
  const WordModel({
    required super.id,
    required super.word,
    required super.translation,
    required super.partOfSpeech,
    required super.level,
    required super.topic,
    required super.example,
    required super.strength,
    required super.createdAt,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      id: json['id'],
      word: json['word'],
      translation: json['translation'],
      partOfSpeech: json['part_of_speech'],
      level: json['level'],
      topic: json['topic'],
      example: json['example'],
      strength: json['strength'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
