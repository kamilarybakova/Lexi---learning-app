import 'package:lexi/features/training/domain/repositories/flashcards_repository.dart';

import '../../../dictionary/domain/entities/word.dart';

class GetFlashcards {
  final FlashcardsRepository repo;

  GetFlashcards(this.repo);

  Future<List<Word>> call() {
    return repo.getFlashcards();
  }
}
