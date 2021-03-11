import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User> signInwithGoogle() async{
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken
    );
    final UserCredential credential = await _firebaseAuth.signInWithCredential(authCredential);
    final User user = credential.user;

    final User currentUser = _firebaseAuth.currentUser;
    assert(currentUser.uid == user.uid);

    return currentUser;
  }

  Future<void> signOutWithGoogle() async{
    return _googleSignIn.signOut();
  }

}