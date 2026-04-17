import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';    // Pour l'accueil
import 'session_page.dart'; // Pour la session de foot

void main() {
  runApp(const FootApp());
}

class FootApp extends StatelessWidget {
  const FootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FootApp',
      theme: ThemeData(primarySwatch: Colors.green),
      // L'application démarre sur la page de connexionflutte
      home: LoginPage(),
    );
  }
}




