import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexi/core/theme/app_colors.dart';
import 'package:lexi/core/tts/tts_service.dart';
import 'package:lexi/l10n/app_localizations.dart';

final ttsLanguageProvider = StateProvider<String>((ref) => 'tr-TR');
final ttsVoiceProvider = StateProvider<String?>((ref) => null);
final ttsSpeedProvider = StateProvider<double>((ref) => 0.45);
final ttsPitchProvider = StateProvider<double>((ref) => 1.0);

class PronunciationScreen extends ConsumerStatefulWidget {
  const PronunciationScreen({super.key});

  @override
  ConsumerState<PronunciationScreen> createState() => _PronunciationScreenState();
}

class _PronunciationScreenState extends ConsumerState<PronunciationScreen> {
  final TtsService _tts = TtsService();
  final String _testWord = 'Merhaba';

  List<Map<String, String>> _availableVoices = [];
  bool _loadingVoices = true;

  final List<TtsLanguage> _languages = [
    TtsLanguage(code: 'tr-TR', name: 'Türkçe', flag: '🇹🇷'),
    TtsLanguage(code: 'en-US', name: 'English (US)', flag: '🇺🇸'),
    TtsLanguage(code: 'en-GB', name: 'English (UK)', flag: '🇬🇧'),
    TtsLanguage(code: 'ru-RU', name: 'Русский', flag: '🇷🇺'),
  ];

  @override
  void initState() {
    super.initState();
    _loadVoices();
  }

  Future<void> _loadVoices() async {
    try {
      final voices = await _tts.getVoices();
      final selectedLanguage = ref.read(ttsLanguageProvider);

      setState(() {
        _availableVoices = voices
            .where((voice) => voice['locale']?.startsWith(selectedLanguage.split('-')[0]) ?? false)
            .toList();
        _loadingVoices = false;
      });
    } catch (e) {
      debugPrint('Error loading voices: $e');
      setState(() => _loadingVoices = false);
    }
  }

  String _getVoiceGender(String voiceName) {
    final lower = voiceName.toLowerCase();
    if (lower.contains('female') || lower.contains('woman') || lower.contains('kadın')) {
      return '👩 Female';
    } else if (lower.contains('male') || lower.contains('man') || lower.contains('erkek')) {
      return '👨 Male';
    }
    return '🗣️ Voice';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final selectedLanguage = ref.watch(ttsLanguageProvider);
    final selectedVoice = ref.watch(ttsVoiceProvider);
    final speed = ref.watch(ttsSpeedProvider);
    final pitch = ref.watch(ttsPitchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.pronunciation),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection('Language'),
          ..._languages.map((language) => _buildLanguageTile(
            language: language,
            isSelected: selectedLanguage == language.code,
            onTap: () async {
              ref.read(ttsLanguageProvider.notifier).state = language.code;
              ref.read(ttsVoiceProvider.notifier).state = null;
              setState(() => _loadingVoices = true);
              await _loadVoices();
            },
          )),

          const SizedBox(height: 32),

          _buildSection('Voice Type'),
          if (_loadingVoices)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),
            )
          else if (_availableVoices.isEmpty)
            _buildNoVoicesCard()
          else
            ..._availableVoices.map((voice) => _buildVoiceTile(
              voice: voice,
              isSelected: selectedVoice == voice['name'],
              onTap: () {
                ref.read(ttsVoiceProvider.notifier).state = voice['name'];
              },
            )),

          const SizedBox(height: 32),

          _buildSection('Speech Rate'),
          _buildSliderCard(
            value: speed,
            min: 0.1,
            max: 1.0,
            label: _speedLabel(speed),
            onChanged: (value) {
              ref.read(ttsSpeedProvider.notifier).state = value;
            },
          ),

          const SizedBox(height: 24),

          _buildSection('Pitch'),
          _buildSliderCard(
            value: pitch,
            min: 0.5,
            max: 2.0,
            label: _pitchLabel(pitch),
            onChanged: (value) {
              ref.read(ttsPitchProvider.notifier).state = value;
            },
          ),

          const SizedBox(height: 32),

          _buildTestButton(
            testWord: _testWord,
            languageCode: selectedLanguage,
            voiceName: selectedVoice,
            speed: speed,
            pitch: pitch,
          ),

          const SizedBox(height: 16),

          _buildResetButton(),
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildLanguageTile({
    required TtsLanguage language,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: AppColors.accent, width: 2)
            : null,
      ),
      child: ListTile(
        leading: Text(
          language.flag,
          style: const TextStyle(fontSize: 28),
        ),
        title: Text(
          language.name,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: AppColors.accent)
            : null,
        onTap: onTap,
      ),
    );
  }

  Widget _buildVoiceTile({
    required Map<String, String> voice,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final voiceName = voice['name'] ?? 'Unknown';
    final gender = _getVoiceGender(voiceName);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: AppColors.accent, width: 2)
            : null,
      ),
      child: ListTile(
        title: Text(
          voiceName,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        subtitle: Text(
          gender,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.play_arrow, size: 20),
              onPressed: () async {
                await _tts.stop();
                await _tts.speak(
                  text: _testWord,
                  languageCode: voice['locale'] ?? ref.read(ttsLanguageProvider),
                  voiceName: voiceName,
                );
              },
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.accent),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildNoVoicesCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Icon(Icons.voice_over_off, size: 48, color: AppColors.textSecondary),
          SizedBox(height: 12),
          Text(
            'No voices available for this language',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderCard({
    required double value,
    required double min,
    required double max,
    required String label,
    required ValueChanged<double> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value.toStringAsFixed(2),
                style: const TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: 20,
            activeColor: AppColors.accent,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildTestButton({
    required String testWord,
    required String languageCode,
    required String? voiceName,
    required double speed,
    required double pitch,
  }) {
    return ElevatedButton.icon(
      onPressed: () async {
        await _tts.stop();

        await _tts.speak(
          text: testWord,
          languageCode: languageCode,
          voiceName: voiceName,
          speed: speed,
          pitch: pitch,
        );
      },
      icon: const Icon(Icons.play_arrow),
      label: Text('Test with "$testWord"'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildResetButton() {
    return OutlinedButton(
      onPressed: () {
        ref.read(ttsLanguageProvider.notifier).state = 'tr-TR';
        ref.read(ttsVoiceProvider.notifier).state = null;
        ref.read(ttsSpeedProvider.notifier).state = 0.45;
        ref.read(ttsPitchProvider.notifier).state = 1.0;
        _loadVoices();
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textSecondary,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text('Reset to Default'),
    );
  }

  String _speedLabel(double speed) {
    if (speed < 0.3) return 'Very Slow';
    if (speed < 0.5) return 'Slow';
    if (speed < 0.7) return 'Normal';
    if (speed < 0.9) return 'Fast';
    return 'Very Fast';
  }

  String _pitchLabel(double pitch) {
    if (pitch < 0.8) return 'Low';
    if (pitch < 1.2) return 'Normal';
    return 'High';
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }
}

class TtsLanguage {
  final String code;
  final String name;
  final String flag;

  TtsLanguage({
    required this.code,
    required this.name,
    required this.flag,
  });
}