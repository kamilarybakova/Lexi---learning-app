import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lexi/core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../add_words/presentation/widgets/drag_handle.dart';
import '../presentation/state/auth_state.dart';
import '../presentation/state/auth_providers.dart';

class AuthRequiredBottomSheet extends ConsumerWidget {
  const AuthRequiredBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authViewModelProvider);

    ref.listen<AuthState>(authViewModelProvider, (prev, next) {
      if (next is AuthAuthenticated) {
        Navigator.pop(context);
      }

      if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message)),
        );
      }
    });

    final isLoading = authState is AuthLoading;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        color: Color(0xFF161822),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            Text(
              l10n?.authSubtitle ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
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
              isLoading: isLoading,
              onPressed: isLoading
                  ? null
                  : () {
                ref
                    .read(authViewModelProvider.notifier)
                    .signInWithGoogle();
              },
            ),

            const SizedBox(height: 12),

            TextButton(
              onPressed: isLoading ? null : () => Navigator.pop(context),
              child: Text(
                l10n?.authLater ?? '',
                style: const TextStyle(color: Color(0xFFB3B6C2)),
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
  final VoidCallback? onPressed;
  final bool isLoading;

  const _GoogleSignInButton({
    required this.onPressed,
    required this.isLoading,
  });

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
        icon: isLoading
            ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : SvgPicture.asset(
          'assets/icons/ic_google.svg',
          height: 20,
        ),
        label: Text(
          isLoading ? '' : 'Continue with Google',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
