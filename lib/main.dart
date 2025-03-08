import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'navbar.dart';
import 'styles/styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Styles.darkPurple, 
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(), // Start with the Navbar
    );
  }
}
