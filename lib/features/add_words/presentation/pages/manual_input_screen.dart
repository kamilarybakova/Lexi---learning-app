import 'package:flutter/material.dart';
import 'package:lexi/features/add_words/presentation/widgets/word_item.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/drag_handle.dart';

class AddManuallyBottomSheet extends StatefulWidget {
  const AddManuallyBottomSheet({super.key});

  @override
  State<AddManuallyBottomSheet> createState() =>
      _AddManuallyBottomSheetState();
}

class _AddManuallyBottomSheetState extends State<AddManuallyBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _words = [];

  void _parseWords() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final parsed = text
        .split(RegExp(r'[\n,;]'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toSet()
        .toList();

    setState(() {
      _words
        ..clear()
        ..addAll(parsed);
    });
  }

  void _removeWord(int index) {
    setState(() {
      _words.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        color: Color(0xFF161822),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DragHandle(),
            const SizedBox(height: 16),

            Text(
              l10n?.addManually ?? 'Add manually',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                l10n?.manualInputHint ??
                    'Enter one or multiple words\n(one per line)',
                filled: true,
                fillColor: const Color(0xFF1E2130),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _parseWords,
                icon: const Icon(Icons.check),
                label: Text(l10n?.check ?? 'Check'),
              ),
            ),

            const SizedBox(height: 16),

            if (_words.isNotEmpty) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n?.detectedWords ?? 'Detected words',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _words.length,
                  itemBuilder: (context, index) {
                    return WordItem(
                      word: _words[index],
                      onDelete: () => _removeWord(index),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
