import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planneroo/models/PlannerooUser.dart';
import 'package:planneroo/services/authentication.dart';
import 'package:planneroo/views/Wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
  ]);
  await Firebase.initializeApp();

  runApp(
    StreamProvider<PlannerooUser>.value(
      value: AuthService.instance().user,
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planneroo',
      theme: ThemeData(
        backgroundColor: Color(0xFFF5FFF9),
        primaryColor: Color(0xFFF5FFF9),
        highlightColor: Color(0xFFF5FFF9)
      ),
      home: Wrapper(),
    );
  }
}
