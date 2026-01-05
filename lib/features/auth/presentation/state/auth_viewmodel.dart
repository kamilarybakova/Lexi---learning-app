import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/storage/secure_storage_provider.dart';
import '../../domain/usecases/sign_in_with_google.dart';
import 'auth_providers.dart';
import 'auth_state.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  final Ref _ref;
  final SignInWithGoogle _signInWithGoogle;

  AuthViewModel(
      this._ref,
      this._signInWithGoogle,
      ) : super(const AuthIdle());

  static const _tokenKey = 'access_token';

  Future<void> signInWithGoogle() async {
    state = const AuthLoading();

    try {
      final authToken = await _signInWithGoogle();

      await _ref.read(secureStorageProvider).write(
        key: _tokenKey,
        value: authToken.accessToken,
      );

      _ref.read(isAuthenticatedProvider.notifier).state = true;

      state = const AuthAuthenticated();
    } catch (e) {
      state = AuthError(_mapError(e));
    }
  }

  Future<void> logout() async {
    await _ref.read(secureStorageProvider).delete(key: _tokenKey);
    _ref.read(isAuthenticatedProvider.notifier).state = false;
    state = const AuthIdle();
  }

  Future<void> restoreSession() async {
    final token =
    await _ref.read(secureStorageProvider).read(key: _tokenKey);

    if (token != null) {
      _ref.read(isAuthenticatedProvider.notifier).state = true;
      state = const AuthAuthenticated();
    }
  }

  String _mapError(Object e) {
    final message = e.toString();

    if (message.contains('aborted')) {
      return 'Sign in cancelled';
    }

    return 'Something went wrong. Please try again.';
  }
}
