import '../../domain/entities/auth_token.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/firebase_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDatasource firebaseDatasource;
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({
    required this.firebaseDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<AuthToken> signInWithGoogle() async {
    final idToken =
    await firebaseDatasource.signInAndGetIdToken();

    final authToken =
    await remoteDatasource.loginWithGoogle(idToken);

    return authToken;
  }
}
