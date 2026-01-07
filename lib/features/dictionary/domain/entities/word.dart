class Word {
  final int id;
  final String word;
  final String translation;
  final String? partOfSpeech;
  final String? level;
  final String topic;
  final String? example;
  final double strength;
  final DateTime createdAt;

  const Word({
    required this.id,
    required this.word,
    required this.translation,
    required this.partOfSpeech,
    required this.level,
    required this.topic,
    required this.example,
    required this.strength,
    required this.createdAt,
  });
}
