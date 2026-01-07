import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexi/core/tts/tts_service.dart';
import 'package:lexi/features/training/presentation/widgets/action_buttons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../profile/presentation/pages/pronunciation_screen.dart';
import '../state/flashcards_provider.dart';
import '../widgets/flash_card.dart';

class FlashCardScreen extends ConsumerStatefulWidget {
  const FlashCardScreen({super.key});

  @override
  ConsumerState<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends ConsumerState<FlashCardScreen>
    with SingleTickerProviderStateMixin {
  bool _isFlipped = false;

  static final TtsService _tts = TtsService();

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _flipAnimation = Tween<double>(begin: 0, end: pi).animate(CurvedAnimation(
      parent: _flipController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFlipped) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    _isFlipped = !_isFlipped;
  }

  Future<void> _handleSpeak(String text) async {
    final language = ref.read(ttsLanguageProvider);
    final voice = ref.read(ttsVoiceProvider);
    final speed = ref.read(ttsSpeedProvider);
    final pitch = ref.read(ttsPitchProvider);

    await _tts.stop();
    await _tts.speak(
      text: text,
      languageCode: language,
      voiceName: voice,
      speed: speed,
      pitch: pitch,
    );
  }

  void _resetCard() {
    _flipController.reset();
    _isFlipped = false;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(flashcardsViewModelProvider);
    final viewModel = ref.read(flashcardsViewModelProvider.notifier);

    if (state.loading) {
      return const CupertinoPageScaffold(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }

    final word = state.current;

    if (word == null) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text(''),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  size: 72,
                  color: AppColors.accent,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Great job!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 40),

                CupertinoButton.filled(
                  onPressed: () async {
                    _resetCard();
                    await viewModel.load();
                  },
                  child: const Text('Start again'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Flashcards'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _flipCard,
              child: AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) {
                  final isBack = _flipAnimation.value > pi / 2;

                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // perspective
                      ..rotateY(_flipAnimation.value),
                    child: isBack
                        ? Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: FlashCard(
                        text: word.translation,
                        isBack: true,
                        onSpeak: () => _handleSpeak(word.translation),
                      ),
                    )
                        : FlashCard(
                      text: word.word,
                      isBack: false,
                      onSpeak: () => _handleSpeak(word.word),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            ActionButtons(
              onKnown: () async {
                await viewModel.answerCurrent(true);
                _resetCard();
              },
              onUnknown: () async {
                await viewModel.answerCurrent(false);
                _resetCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}