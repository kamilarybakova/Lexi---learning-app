import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthRequiredBottomSheet extends StatelessWidget {
  const AuthRequiredBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
            _DragHandle(),
            const SizedBox(height: 16),

            const Text(
              'Sign in to add words',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Create an account to save your words,\n'
                  'sync between devices and use AI features.',
              style: TextStyle(
                color: Color(0xFFB3B6C2),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 20),

            _FeatureRow(
              icon: Icons.cloud_done,
              text: 'Sync words between devices',
            ),
            _FeatureRow(
              icon: Icons.psychology,
              text: 'AI translation and categorization',
            ),
            _FeatureRow(
              icon: Icons.security,
              text: 'Safe cloud storage',
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
                child: const Text(
                  'Maybe later',
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

class _DragHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2E42),
          borderRadius: BorderRadius.circular(2),
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
          backgroundColor: Colors.black,
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
