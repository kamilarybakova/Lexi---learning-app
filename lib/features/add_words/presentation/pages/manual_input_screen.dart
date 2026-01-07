import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexi/features/add_words/presentation/widgets/word_item.dart';

import '../../../../l10n/app_localizations.dart';
import '../state/add_words_viewmodel.dart';
import '../widgets/drag_handle.dart';

class AddManuallyBottomSheet extends ConsumerStatefulWidget {
  const AddManuallyBottomSheet({super.key});

  @override
  ConsumerState<AddManuallyBottomSheet> createState() =>
      _AddManuallyBottomSheetState();
}

class _AddManuallyBottomSheetState
    extends ConsumerState<AddManuallyBottomSheet> {
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

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    ref.read(addWordsProvider.notifier).setWords(_words);
    await ref.read(submitAddWordsProvider)();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: SingleChildScrollView(
          child: Container(
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

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _words.length,
                      itemBuilder: (context, index) {
                        return WordItem(
                          word: _words[index],
                          onDelete: () => _removeWord(index),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
