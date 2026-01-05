import 'package:flutter/material.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/profile/presentation/widgets/language.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const LexiApp());
}

class LexiApp extends StatefulWidget {
  const LexiApp({super.key});

  @override
  State<LexiApp> createState() => _LexiAppState();
}

class _LexiAppState extends State<LexiApp> {
  Locale _locale = const Locale('ru');

  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LocaleController(
      setLocale: _setLocale,
      child: MaterialApp(
        title: 'Lexi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF0E0F14),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF7C7CFF),
            secondary: Color(0xFFA5A5FF),
            surface: Color(0xFF0E0F14),
          ),
        ),
        locale: _locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomeScreen(),
      ),
    );
  }
}
