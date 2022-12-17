import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static GoogleSignIn googleSignIn = GoogleSignIn();
  static FirebaseAuth emailSignIn = FirebaseAuth.instance;

  GoogleSignInAccount? user;

  //Login with google
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Login with email and password
  Future<UserCredential?> signInWithEmailandPass(
      {required String email, required String password}) async {
    try {
      final emailUser = await emailSignIn.signInWithEmailAndPassword(
          email: email, password: password);
      return emailUser;
    } on FirebaseException catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
  Future logout() async {
    try {
      await emailSignIn.signOut();
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return null;
    }
  }
}
