import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: ContactPage(),
  ));
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(230, 229, 228, 1),
                Color.fromRGBO(230, 229, 228, 1),
                Color.fromRGBO(230, 229, 228, 1),
              ],
              stops: [0.14, 0.48, 0.85],
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          
          children: [
            SizedBox(height: 100), // Ajoute un espacement de 100 pixels en haut
            Text(
              'Vous pouvez nous contacter sur téléphone ou Whatsapp',
              textAlign: TextAlign.center, // Centre le texte
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Couleur du texte
              ),
            ),
            SizedBox(height: 40), // Ajoute un espacement entre le texte et les conteneurs
            GestureDetector(
              onTap: () {
                _launchWhatsApp();
              },
           child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 181, 219, 211),
                borderRadius: BorderRadius.circular(10),  
               ),
              child: Image.asset(
                'assets/2.png',
                fit: BoxFit.contain,
                width: 100, // Définir la largeur de l'image
                height: 100, // Définir la hauteur de l'image
              ),
              ),
              
            ),
              
            SizedBox(height: 40), // Ajoute un espacement entre les deux conteneurs
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(177, 247, 85, 136),
                borderRadius: BorderRadius.circular(10),),
              child: Image.asset(
                'assets/3.png',
                fit: BoxFit.contain,
                width: 100, // Définir la largeur de l'image
                height: 100, // Définir la hauteur de l'image
              ),
              ),
            
          ],
        ),
      ),
    );
  
  }
   // Fonction pour ouvrir WhatsApp
  void _launchWhatsApp() async {
    const url = 'https://api.whatsapp.com/send?phone=99361099';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible de lancer $url';
    }
  }
}

