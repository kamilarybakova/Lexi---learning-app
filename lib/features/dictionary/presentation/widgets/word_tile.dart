import 'package:flutter/material.dart';
import 'package:lexi/core/theme/app_colors.dart';
import '../../domain/word_item.dart';

class WordTile extends StatelessWidget {
  const WordTile({super.key, required this.word});

  final WordItem word;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word.word,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  word.translation,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            icon: const Icon(
              Icons.volume_up_rounded,
              color: AppColors.accent,
            ),
            onPressed: () {
              debugPrint('Play sound for: ${word.word}');
            },
          ),
        ],
      ),
    );
  }
}
