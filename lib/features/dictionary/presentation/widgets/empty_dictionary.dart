import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class EmptyDictionary extends StatelessWidget {
  const EmptyDictionary({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.menu_book_outlined,
              size: 80,
              color: Color(0xFF6F7382),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.emptyDictionaryTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.emptyDictionarySubtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFB3B6C2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
