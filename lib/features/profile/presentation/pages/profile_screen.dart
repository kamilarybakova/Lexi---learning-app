import 'package:flutter/material.dart';
import 'package:lexi/features/profile/presentation/widgets/switch_tile.dart';
import 'package:lexi/features/profile/presentation/widgets/tile.dart';
import 'package:lexi/l10n/app_localizations.dart';

import '../widgets/language.dart';
import '../widgets/section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profile),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Section(title: l10n.learning),
          Tile(
            icon: Icons.flag,
            title: l10n.learningGoal,
            subtitle: l10n.goalTravel, // mock
            onTap: () {},
            isDestructive: false,
          ),
          Tile(
            icon: Icons.language,
            title: l10n.learningLanguage,
            subtitle: 'English → Turkish', // mock
            onTap: () {},
            isDestructive: false,
          ),

          const SizedBox(height: 24),

          Section(title: l10n.notifications),
          SwitchTile(
            icon: Icons.notifications,
            title: l10n.dailyReminder,
            value: true,
            onChanged: (value) {},
          ),

          const SizedBox(height: 24),

          Section(title: l10n.preferences),
          Tile(
            icon: Icons.translate,
            title: l10n.language,
            subtitle: _currentLanguageLabel(context),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LanguageScreen()),
              );
            },
            isDestructive: false,
          ),
          Tile(
            icon: Icons.volume_up,
            title: l10n.pronunciation,
            subtitle: 'US · Normal',
            onTap: () {},
            isDestructive: false,
          ),

          const SizedBox(height: 24),

          Section(title: l10n.data),
          Tile(
            icon: Icons.upload_file,
            title: l10n.exportWords,
            onTap: () {},
            isDestructive: false,
          ),
          Tile(
            icon: Icons.restart_alt,
            title: l10n.resetProgress,
            isDestructive: true,
            onTap: () {},
          ),

          const SizedBox(height: 24),

          Section(title: l10n.app),
          Tile(
            icon: Icons.info_outline,
            title: l10n.about,
            onTap: () {},
            isDestructive: false,
          ),
        ],
      ),
    );
  }

  String _currentLanguageLabel(BuildContext context) {
    final code = Localizations.localeOf(context).languageCode;
    switch (code) {
      case 'ru':
        return 'Русский';
      case 'ky':
        return 'Кыргызча';
      case 'tr':
        return 'Türkçe';
      default:
        return 'English';
    }
  }
}
