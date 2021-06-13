import 'package:flutter/material.dart';
import 'package:planneroo/services/authentication.dart';

class SignInPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Log In",
                style: TextStyle(
                  fontSize: 30
                )
              ),
              SizedBox(height: 50,),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Continue with Google"),
                onPressed: (){
                  AuthService.instance().signInWithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}