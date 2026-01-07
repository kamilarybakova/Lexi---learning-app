import 'package:lexi/features/training/data/datasources/flashcards_datasource.dart';

import '../../../dictionary/domain/entities/word.dart';
import '../../domain/repositories/flashcards_repository.dart';

class FlashcardsRepositoryImpl implements FlashcardsRepository {
  final FlashcardsDatasource remoteDatasource;

  FlashcardsRepositoryImpl({
    required this.remoteDatasource
});

  @override
  Future<List<Word>> getFlashcards() {
    return remoteDatasource.getFlashcards();
  }

  @override
  Future<Word> answerWord(int id, bool correct) async {
    return await remoteDatasource.answerWord(wordId: id, correct: correct);
  }
}
