import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasource/add_word_remote_datasource.dart';

final addWordRemoteDatasourceProvider =
Provider<AddWordRemoteDatasource>((ref) {
  final dio = ref.read(dioProvider);
  return AddWordRemoteDatasource(dio);
});

final submitAddWordsProvider =
Provider<Future<void> Function()>((ref) {
  final datasource = ref.read(addWordRemoteDatasourceProvider);

  return () async {
    final words = ref.read(addWordsProvider);

    if (words.isEmpty) return;

    final rawText = words.join(', ');

    await datasource.addWords(rawText);

    ref.read(addWordsProvider.notifier).clear();
  };
});

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
