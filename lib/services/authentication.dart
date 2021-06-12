
import 'package:google_sign_in/google_sign_in.dart';

/// Class that handles the entire authentication process
class AuthService{
  static final AuthService _instance = AuthService.instance();
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  factory AuthService(){
    return _instance;
  }

  AuthService.instance();

  signInWithGoogle(){

  }

}