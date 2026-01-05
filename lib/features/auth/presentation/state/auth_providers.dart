import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasources/firebase_auth_datasource.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/sign_in_with_google.dart';
import 'auth_viewmodel.dart';
import 'auth_state.dart';

/// Firebase
final firebaseAuthProvider =
Provider((ref) => FirebaseAuth.instance);

final googleSignInProvider =
Provider((ref) => GoogleSignIn());

final isAuthenticatedProvider = StateProvider<bool>((ref) => false);

/// Dio
final dioProvider = Provider<Dio>((ref) => dio);

/// Datasources
final firebaseAuthDatasourceProvider = Provider(
      (ref) => FirebaseAuthDatasource(
    ref.read(firebaseAuthProvider),
    ref.read(googleSignInProvider),
  ),
);

final authRemoteDatasourceProvider = Provider(
      (ref) => AuthRemoteDatasource(
    ref.read(dioProvider),
  ),
);

/// Repository
final authRepositoryProvider = Provider(
      (ref) => AuthRepositoryImpl(
    firebaseDatasource:
    ref.read(firebaseAuthDatasourceProvider),
    remoteDatasource:
    ref.read(authRemoteDatasourceProvider),
  ),
);

/// Use case
final signInWithGoogleProvider = Provider(
      (ref) => SignInWithGoogle(
    ref.read(authRepositoryProvider),
  ),
);

/// ViewModel
final authViewModelProvider =
StateNotifierProvider<AuthViewModel, AuthState>(
      (ref) => AuthViewModel(
    ref,
    ref.read(signInWithGoogleProvider),
  ),
);

