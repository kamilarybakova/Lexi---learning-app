import '../entities/auth_token.dart';

abstract class AuthRepository {
  Future<AuthToken> signInWithGoogle();
}
