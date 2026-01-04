import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class TodayTrainingCard extends StatelessWidget {
  const TodayTrainingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    const wordsCount = 6;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2130),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.school,
            size: 32,
            color: Color(0xFF7C7CFF),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.todayTraining,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.wordsWaiting(wordsCount),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFB3B6C2),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFFB3B6C2),
          ),
        ],
      ),
    );
  }
}
