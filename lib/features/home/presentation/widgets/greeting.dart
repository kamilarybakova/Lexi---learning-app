import 'package:flutter/cupertino.dart';
import '../../../../l10n/app_localizations.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  String _getGreeting(AppLocalizations l10n) {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return l10n.greetingMorning;
    } else if (hour >= 12 && hour < 17) {
      return l10n.greetingAfternoon;
    } else if (hour >= 17 && hour < 21) {
      return l10n.greetingEvening;
    } else {
      return l10n.greetingNight;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Text(
      '${_getGreeting(l10n)}\n${l10n.dashboardSubtitle}',
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.white,
      ),
    );
  }
}
