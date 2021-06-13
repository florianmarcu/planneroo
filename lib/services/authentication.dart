
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:planneroo/models/PlannerooUser.dart';

/// Class that handles the entire authentication process
class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final AuthService _instance = AuthService.instance();
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  factory AuthService(){
    return _instance;
  }

  AuthService.instance();

  // create user object based on FirebaseUser
  PlannerooUser _ourUserFromFirebaseUser(User user){
    return user != null 
    ? PlannerooUser(
      uid: user.uid,
      email: user.email,
      photoURL: user.photoURL,
      displayName: user.displayName != null 
        ? user.displayName 
        : (user.email != null
          ? user.email.substring(0,user.email.indexOf('@'))
          : "Guest"),
    ) 
    : null;
  }

  Stream<PlannerooUser> get user{
    return (_auth.authStateChanges()
      .map(_ourUserFromFirebaseUser));
  }

  void updateUserData(User user, [String credentialProvider]) async{

    // DocumentReference ref = _db.collection('users').doc(user.uid);
    // DocumentSnapshot document = await ref.get();
    // await _saveDeviceToken(user.uid);
    // if(document.data() == null){
    //   AnalyticsService().analytics.logSignUp(signUpMethod: credentialProvider);
    //   g.isNewUser = true;
    //   ref.set({
    //     'uid' : user.uid,
    //     'email' : user.email,
    //     'photoURL' : user.photoURL,
    //     'display_name' : (user.displayName != null || user.isAnonymous == true) ? user.displayName : user.email.substring(0,user.email.indexOf('@')),
    //     'score' : 0,
    //     'date_registered': FieldValue.serverTimestamp(),
    //     },
    //     SetOptions(merge: true)
    //   );
      
    // }
  }

  Future signInWithGoogle() async{
    try{
      await _googleSignIn.signOut();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, 
        accessToken: googleAuth.accessToken
      );
      final User user = (await _auth.signInWithCredential(credential)).user;
      if(user != null)
        updateUserData(user,'google');
    }
    catch(error){
      print(error);
      return(error);
    }
  }

  // sign out
  Future signOut() async{
    try{
      await _auth.signOut();
      
    }
    catch(error){
      return(error);
    }
  }

}