import 'package:flutter/cupertino.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFFB3B6C2),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
