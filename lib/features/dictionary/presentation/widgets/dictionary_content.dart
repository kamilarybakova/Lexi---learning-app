import 'package:flutter/material.dart';
import 'package:lexi/features/dictionary/presentation/widgets/word_tile.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/word_item.dart';

class DictionaryContent extends StatelessWidget {
  const DictionaryContent({super.key, required this.words});

  final List<WordItem> words;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        const _SearchField(),
        const SizedBox(height: 28),
        const _CategoriesChips(),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: words.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return WordTile(word: words[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
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

class _CategoriesChips extends StatelessWidget {
  const _CategoriesChips();

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Food', 'Travel', 'Verb'];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == 0;

          return ChoiceChip(
            label: Text(categories[index]),
            selected: isSelected,
            onSelected: (_) {},
            selectedColor: const Color(0xFF7C7CFF),
            backgroundColor: const Color(0xFF1E2130),
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFFB3B6C2),
            ),
          );
        },
      ),
    );
  }
}

