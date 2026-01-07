import 'package:flutter/cupertino.dart';

import '../../../../core/theme/app_colors.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onKnown;
  final VoidCallback onUnknown;

  const ActionButtons({super.key, required this.onKnown, required this.onUnknown});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _CircleButton(
          icon: CupertinoIcons.xmark,
          color: AppColors.wordDifficult,
          onTap: onUnknown,
        ),
        const SizedBox(width: 40),
        _CircleButton(
          icon: CupertinoIcons.check_mark,
          color: AppColors.wordKnown,
          onTap: onKnown,
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.15),
        ),
        child: Icon(
          icon,
          size: 32,
          color: color,
        ),
      ),
    );
  }
}
