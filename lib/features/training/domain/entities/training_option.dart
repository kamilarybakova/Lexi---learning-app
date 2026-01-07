import 'package:flutter/cupertino.dart';

class TrainingOption {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  TrainingOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });
}
