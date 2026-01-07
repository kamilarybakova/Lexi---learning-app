import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/dictionary_provider.dart';
import '../state/dictionary_state.dart';
import '../widgets/dictionary_content.dart';
import '../widgets/empty_dictionary.dart';

class DictionaryScreen extends ConsumerStatefulWidget {
  const DictionaryScreen({super.key});

  @override
  ConsumerState<DictionaryScreen> createState() =>
      _DictionaryScreenState();
}

class _DictionaryScreenState
    extends ConsumerState<DictionaryScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(wordsVmProvider.notifier).loadWords();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary'),
      ),
      body: const DictionaryBody(),
    );
  }
}

class DictionaryBody extends ConsumerWidget {
  const DictionaryBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wordsVmProvider);

    return switch (state) {
      DictionaryInitialLoading() =>
      const Center(child: CircularProgressIndicator()),

      DictionaryError(:final message) =>
          Center(child: Text(message)),

      DictionaryData(:final words, :final isUpdating) =>
          Stack(
            children: [
              words.isEmpty
                  ? const EmptyDictionary()
                  : DictionaryContent(words: words),

              if (isUpdating)
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(),
                ),
            ],
          ),

      _ => const SizedBox.shrink(),
    };
  }
}
