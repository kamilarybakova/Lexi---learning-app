import 'package:lexi/features/training/domain/repositories/flashcards_repository.dart';

import '../../../dictionary/domain/entities/word.dart';

class AnswerWord {
  final FlashcardsRepository repo;

  AnswerWord(this.repo);

  Future<Word> call(int wordId, bool correct) {
    return repo.answerWord(wordId, correct);
  }
}
