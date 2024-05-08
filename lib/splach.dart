// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pfe/main.dart';
import 'package:pfe/signin.dart'; // Importez l'écran suivant

void main() {
  runApp(MaterialApp(
     // Définissez l'écran de splash comme écran d'accueil
  ));
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Démarrez un minuteur pour retarder la navigation vers l'écran suivant
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>SignInPage()), // AccueilPage est l'écran suivant
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/1.png', // Chemin vers votre image de splash
          fit: BoxFit.cover, // Ajustez la façon dont l'image est ajustée à la boîte
        ),
      ),
    );
  }
}
