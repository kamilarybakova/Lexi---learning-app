import 'package:flutter/material.dart';

import '../../domain/word_item.dart';
import '../widgets/dictionary_content.dart';
import '../widgets/empty_dictionary.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WordItem> words = [
      WordItem(word: 'apple', translation: 'яблоко', category: 'Food'),
      WordItem(word: 'run', translation: 'бежать', category: 'Verb'),
      WordItem(word: 'airport', translation: 'аэропорт', category: 'Travel'),
    ];

    return Scaffold(
      body: words.isEmpty
          ? const EmptyDictionary()
          : DictionaryContent(words: words),
    );
  }
}
