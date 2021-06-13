import 'package:flutter/material.dart';
import 'package:planneroo/models/PlannerooUser.dart';
import 'package:planneroo/views/HomePage.dart';
import 'package:planneroo/views/SignInPage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<PlannerooUser>(context);

    if(user != null)
      return HomePage();
    else return SignInPage();
  }
}