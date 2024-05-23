import 'package:flutter/material.dart';
import 'package:pfe/confidentialite.dart';
import 'package:pfe/contact.dart';
import 'package:pfe/info.dart';
import 'package:pfe/motdepasse.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paramètre',
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
        automaticallyImplyLeading: false, // Enlever l'icône de retour

        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Première rangée
          Container(
            padding: EdgeInsets.all(8.0),
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(230, 229, 228, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Box à gauche avec une icône
                Container(
                  margin: EdgeInsets.only(right: 22.0, left: 10, top: 5),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Texte et autres éléments à droite
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nom de l\'utilisateur',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Détails supplémentaires',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Espacement entre les rangées
          // Deuxième rangée
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(15.0),
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color.fromRGBO(230, 229, 228, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Box à gauche avec une icône
                Container(
                  margin: EdgeInsets.only(right: 22.0, left: 10, top: 5),
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Icon(
                      Icons.person_2,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Texte et autres éléments à droite
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InfoPage()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Information de compte',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Troisième rangée

          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(15.0),
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color.fromRGBO(230, 229, 228, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Box à gauche avec une icône
                Container(
                  margin: EdgeInsets.only(right: 22.0, left: 10, top: 5),
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Icon(
                      Icons.security,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Texte et autres éléments à droite
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MotDePassePage()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Changet le mot de passe',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Quatrième rangée

          // Cinquième rangée

          Container(
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(8),
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color.fromRGBO(230, 229, 228, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Box à gauche avec une icône
                Container(
                  margin: EdgeInsets.only(right: 22.0, left: 10, top: 5),
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Texte et autres éléments à droite
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactPage()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contacter',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(8),
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color.fromRGBO(230, 229, 228, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Box à gauche avec une icône
                Container(
                  margin: EdgeInsets.only(right: 22.0, left: 10, top: 5),
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Icon(
                      Icons.policy,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Texte et autres éléments à droite
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfiPage()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Politique et confidentialité',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(8),
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color.fromRGBO(255, 154, 154, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Box à gauche avec une icône
                Container(
                  margin: EdgeInsets.only(right: 22.0, left: 10, top: 5),
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Texte et autres éléments à droite
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Déconnecter',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
