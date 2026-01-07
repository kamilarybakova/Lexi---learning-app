import '../../../dictionary/domain/entities/word.dart';

abstract class FlashcardsRepository {
  Future<List<Word>> getFlashcards();
  Future<Word> answerWord(int id, bool correct);
}
