import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexi/features/dictionary/domain/entities/word.dart';
import 'package:lexi/features/dictionary/presentation/widgets/word_tile.dart';

import '../../../../l10n/app_localizations.dart';
import '../state/dictionary_provider.dart';

class DictionaryContent extends ConsumerStatefulWidget {
  const DictionaryContent({super.key, required this.words});

  final List<Word> words;

  @override
  ConsumerState<DictionaryContent> createState() =>
      _DictionaryContentState();
}

class _DictionaryContentState
    extends ConsumerState<DictionaryContent> {

  late final List<String> categories;

  @override
  void initState() {
    super.initState();
    categories = [
      'All',
      ...widget.words.map((w) => w.topic).toSet(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        _SearchField(ref: ref),
        const SizedBox(height: 28),
        _CategoriesChips(
          ref: ref,
          categories: categories,
        ),
        const SizedBox(height: 12),
        Expanded(
          child: _WordsList(words: widget.words),
        ),
      ],
    );
  }
}

class _WordsList extends StatelessWidget {
  const _WordsList({required this.words});

  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: words.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return WordTile(word: words[index]);
      },
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.ref});

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: (value) {
          ref.read(wordsVmProvider.notifier).searchWords(value);
        },
        decoration: InputDecoration(
          hintText: l10n.searchHint,
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: const Color(0xFF1E2130),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _CategoriesChips extends ConsumerStatefulWidget {
  const _CategoriesChips({
    required this.ref,
    required this.categories,
  });

  final WidgetRef ref;
  final List<String> categories;

  @override
  ConsumerState<_CategoriesChips> createState() =>
      _CategoriesChipsState();
}

class _CategoriesChipsState
    extends ConsumerState<_CategoriesChips> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final categories = widget.categories;

    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          final category = categories[index];

          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            onSelected: (_) {
              setState(() => selectedIndex = index);

              if (category == 'All') {
                widget.ref.read(wordsVmProvider.notifier).loadWords();
              } else {
                widget.ref
                    .read(wordsVmProvider.notifier)
                    .loadByTopic(category);
              }
            },
            selectedColor: const Color(0xFF7C7CFF),
            backgroundColor: const Color(0xFF1E2130),
            labelStyle: TextStyle(
              color:
              isSelected ? Colors.white : const Color(0xFFB3B6C2),
            ),
          );
        },
      ),
    );
  }
}