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
      theme: ThemeData(
        backgroundColor: Color(0xFFF5FFF9),
        primaryColor: Color(0xFFF5FFF9),
        highlightColor: Color(0xFFF5FFF9)
      ),
      home: HomePage(),
    );
  }
}
