import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as dev; // Recommended for Flutter logging

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
    dev.log('AuthViewModel: Starting Google Sign-In', name: 'auth');
    state = const AuthLoading();

    try {
      final authToken = await _signInWithGoogle();
      dev.log('AuthViewModel: Google Sign-In successful, received token', name: 'auth');

      await _ref.read(secureStorageProvider).write(
        key: _tokenKey,
        value: authToken.accessToken,
      );
      dev.log('AuthViewModel: Token saved to secure storage', name: 'auth');

      _ref.read(isAuthenticatedProvider.notifier).state = true;
      state = const AuthAuthenticated();
      dev.log('AuthViewModel: State updated to AuthAuthenticated', name: 'auth');
    } catch (e, stackTrace) {
      final errorMessage = _mapError(e);
      dev.log(
        'AuthViewModel: Error during Google Sign-In',
        name: 'auth',
        error: e,
        stackTrace: stackTrace,
      );
      state = AuthError(errorMessage);
    }
  }

  Future<void> logout() async {
    dev.log('AuthViewModel: Initiating logout', name: 'auth');
    try {
      await _ref.read(secureStorageProvider).delete(key: _tokenKey);
      _ref.read(isAuthenticatedProvider.notifier).state = false;
      state = const AuthIdle();
      dev.log('AuthViewModel: Logout complete, storage cleared', name: 'auth');
    } catch (e) {
      dev.log('AuthViewModel: Error during logout', name: 'auth', error: e);
    }
  }

  Future<void> restoreSession() async {
    dev.log('AuthViewModel: Checking for existing session...', name: 'auth');
    try {
      final token = await _ref.read(secureStorageProvider).read(key: _tokenKey);

      if (token != null) {
        dev.log('AuthViewModel: Valid token found. Restoring session.', name: 'auth');
        _ref.read(isAuthenticatedProvider.notifier).state = true;
        state = const AuthAuthenticated();
      } else {
        dev.log('AuthViewModel: No token found. User is a guest.', name: 'auth');
        state = const AuthIdle();
      }
    } catch (e) {
      dev.log('AuthViewModel: Session restoration failed', name: 'auth', error: e);
      state = const AuthIdle();
    }
  }

  String _mapError(Object e) {
    final message = e.toString();
    if (message.contains('aborted')) return 'Sign in cancelled';
    return 'Something went wrong. Please try again.';
  }
}