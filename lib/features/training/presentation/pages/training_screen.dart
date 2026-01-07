import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lexi/features/training/presentation/pages/flash_card_screen.dart';

import '../../domain/entities/training_option.dart';
import '../widgets/training_tile.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      TrainingOption(
        title: 'Flashcards',
        subtitle: 'Learn new words',
        icon: CupertinoIcons.rectangle_stack,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FlashCardScreen()),
          );
        },
      ),
      TrainingOption(
        title: 'Multiple Choice',
        subtitle: 'Choose the correct translation',
        icon: CupertinoIcons.checkmark_circle,
        onTap: () {
          debugPrint('Multiple Choice tapped');
        },
      ),
    ];

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Training'),
      ),
      child: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: options.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final option = options[index];
            return TrainingTile(option: option);
          },
        ),
      ),
    );
  }
}