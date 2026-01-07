import '../../../dictionary/domain/entities/word.dart';

abstract class AddWordRepository {
  Future<List<Word>> addWords(String rawText);
}
