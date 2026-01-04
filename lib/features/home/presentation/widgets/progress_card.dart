import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    const learned = 4;
    const total = 10;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2130),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.todayProgress,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          const LinearProgressIndicator(
            value: learned / total,
            minHeight: 8,
            backgroundColor: Color(0xFF2A2E42),
            valueColor: AlwaysStoppedAnimation(Color(0xFF7C7CFF)),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.wordsLearned(learned, total),
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFB3B6C2),
            ),
          ),
        ],
      ),
    );
  }
}
