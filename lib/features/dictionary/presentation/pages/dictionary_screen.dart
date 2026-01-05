import 'package:flutter/material.dart';

import '../../domain/word_item.dart';
import '../widgets/dictionary_content.dart';
import '../widgets/empty_dictionary.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WordItem> words = [
      WordItem(word: 'armut', translation: 'груша', category: 'Food'),
      WordItem(word: 'merhaba', translation: 'привет', category: 'Greeting'),
      WordItem(word: 'havaalani', translation: 'аэропорт', category: 'Travel'),
    ];

    return Scaffold(
      body: words.isEmpty
          ? const EmptyDictionary()
          : DictionaryContent(words: words),
    );
  }
}
