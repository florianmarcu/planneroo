import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planneroo/views/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planneroo',
      home: Container(
        child: HomePage()
      ),
    );
  }
}
