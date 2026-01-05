import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lexi/core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../add_words/presentation/widgets/drag_handle.dart';

class AuthRequiredBottomSheet extends StatelessWidget {
  const AuthRequiredBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        color: Color(0xFF161822),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DragHandle(),
            const SizedBox(height: 16),

            Text(
              l10n?.authTitle ?? '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              l10n?.authSubtitle ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFB3B6C2),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 20),

            _FeatureRow(
              icon: Icons.cloud_done,
              text: l10n?.authFeatureSync ?? '',
            ),
            _FeatureRow(
              icon: Icons.psychology,
              text: l10n?.authFeatureAI ?? '',
            ),
            _FeatureRow(
              icon: Icons.security,
              text: l10n?.authFeatureSecurity ?? '',
            ),

            const SizedBox(height: 24),

            _GoogleSignInButton(
              onPressed: () {
                // TODO: Google sign in
                // authService.signInWithGoogle();
              },
            ),

            const SizedBox(height: 12),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  l10n?.authLater ?? '',
                  style: TextStyle(color: Color(0xFFB3B6C2)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF7C7CFF)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Color(0xFFB3B6C2)),
            ),
          ),
        ],
      ),
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _GoogleSignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        icon: SvgPicture.asset(
          'assets/icons/ic_google.svg',
          height: 20,
        ),
        label: const Text(
          'Continue with Google',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
