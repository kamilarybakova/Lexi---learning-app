import '../entities/auth_token.dart';
import '../repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<AuthToken> call() {
    return repository.signInWithGoogle();
  }
}
