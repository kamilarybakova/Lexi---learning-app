import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexi/features/training/data/datasources/flashcards_datasource.dart';
import 'package:lexi/features/training/data/repositories/flashcards_repository_impl.dart';
import 'package:lexi/features/training/domain/repositories/flashcards_repository.dart';

import '../../../../core/network/dio_client.dart';
import '../../domain/usecases/answer_word.dart';
import '../../domain/usecases/get_flashcards.dart';
import 'flashcards_state.dart';
import 'flashcards_vm.dart';

final flashcardsRemoteDatasourceProvider = Provider(
      (ref) => FlashcardsDatasource(
    ref.read(dioProvider),
  ),
);

final flashcardsRepositoryProvider =
Provider<FlashcardsRepository>((ref) {
  return FlashcardsRepositoryImpl(
    remoteDatasource: ref.read(flashcardsRemoteDatasourceProvider),
  );
});

final getFlashcardsProvider = Provider<GetFlashcards>((ref) {
  return GetFlashcards(ref.read(flashcardsRepositoryProvider));
});

final flashcardsViewModelProvider =
StateNotifierProvider.autoDispose<
    FlashcardsViewModel,
    FlashcardsState>(
      (ref) {
    final repo = ref.watch(flashcardsRepositoryProvider);

    return FlashcardsViewModel(
      GetFlashcards(repo),
      AnswerWord(repo),
    )..load();
  },
);
