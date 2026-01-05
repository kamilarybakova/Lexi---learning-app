import 'package:flutter_riverpod/flutter_riverpod.dart';

final addWordsProvider =
StateNotifierProvider<AddWordsViewModel, List<String>>(
      (ref) => AddWordsViewModel(),
);

class AddWordsViewModel extends StateNotifier<List<String>> {
  AddWordsViewModel() : super([]);

  void setWords(List<String> words) {
    state = words;
  }

  void removeWord(int index) {
    final list = [...state];
    list.removeAt(index);
    state = list;
  }

  void updateWord(int index, String value) {
    final list = [...state];
    list[index] = value;
    state = list;
  }

  void clear() {
    state = [];
  }
}
