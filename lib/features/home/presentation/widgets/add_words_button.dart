import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class AddWordsButton extends StatelessWidget {
  const AddWordsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: () {
          // TODO: navigate to Add Words screen
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          l10n.addWords,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7C7CFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
