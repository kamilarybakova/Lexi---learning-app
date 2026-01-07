import '../../../dictionary/domain/entities/word.dart';

class FlashcardsState {
  final List<Word> words;
  final int index;
  final bool loading;

  const FlashcardsState({
    required this.words,
    required this.index,
    required this.loading,
  });

  factory FlashcardsState.initial() {
    return const FlashcardsState(
      words: [],
      index: 0,
      loading: true,
    );
  }

  Word? get current =>
      index < words.length ? words[index] : null;

  int get total => words.length;
  int get completed => index;

  FlashcardsState copyWith({
    List<Word>? words,
    int? index,
    bool? loading,
  }) {
    return FlashcardsState(
      words: words ?? this.words,
      index: index ?? this.index,
      loading: loading ?? this.loading,
    );
  }
}
