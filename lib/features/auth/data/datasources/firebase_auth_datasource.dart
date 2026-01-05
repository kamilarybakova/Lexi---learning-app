import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDatasource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthDatasource(
      this._firebaseAuth,
      this._googleSignIn,
      );

  Future<String> signInAndGetIdToken() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception('Google sign in aborted');
    }

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final userCredential =
    await _firebaseAuth.signInWithCredential(credential);

    final idToken = await userCredential.user?.getIdToken();

    if (idToken == null) {
      throw Exception('Failed to get id token');
    }

    return idToken;
  }
}
