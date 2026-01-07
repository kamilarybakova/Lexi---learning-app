import 'dart:math';
import 'package:flutter/cupertino.dart';
import '../../../../core/theme/app_colors.dart';

class FlashCard extends StatelessWidget {
  final String text;
  final bool isBack;
  final VoidCallback? onSpeak;

  const FlashCard({super.key, required this.text, required this.isBack, this.onSpeak});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: isBack ? Matrix4.rotationY(pi) : Matrix4.identity(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.45,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.backgroundCard,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {},
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: onSpeak,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: isBack ? Matrix4.rotationY(pi) : Matrix4.identity(),
                    child: const Icon(
                      CupertinoIcons.speaker_2_fill,
                      color: Color(0xFF7C7CFF),
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Transform(
                alignment: Alignment.center,
                transform: isBack ? Matrix4.rotationY(pi) : Matrix4.identity(),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}