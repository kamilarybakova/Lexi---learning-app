import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/answer_word.dart';
import '../../domain/usecases/get_flashcards.dart';
import 'flashcards_state.dart';


class FlashcardsViewModel extends StateNotifier<FlashcardsState> {
  final GetFlashcards _getFlashcards;
  final AnswerWord _answerWord;

  FlashcardsViewModel(
      this._getFlashcards,
      this._answerWord,
      ) : super(FlashcardsState.initial());

  Future<void> load() async {
    state = state.copyWith(loading: true);

    final words = await _getFlashcards();

    state = state.copyWith(
      words: words,
      index: 0,
      loading: false,
    );
  }

  Future<void> answerCurrent(bool correct) async {
    final word = state.current;
    if (word == null) return;

    await _answerWord(word.id, correct);

    state = state.copyWith(
      index: state.index + 1,
    );
  }
}

