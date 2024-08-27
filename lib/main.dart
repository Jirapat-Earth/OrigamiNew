import 'package:flutter/material.dart';
import 'Login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Origami System',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginPage(num: 0, popPage: 0,),
    );
  }
}


