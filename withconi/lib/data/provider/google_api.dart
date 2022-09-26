import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../configs/constants/auth_variables.dart';

class GoogleAPI {
  Future<OAuthCredential> getGoogleCredential() async {
    try {
      final GoogleSignInAuthentication? googleAuth =
          await googleSignIn.currentUser!.authentication;

      // Create a new credential
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return credential;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getGoogleUserEmail() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      String? email = googleUser?.email;

      return email!;
    } catch (e) {
      rethrow;
    }
  }
}
