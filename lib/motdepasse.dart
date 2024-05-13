import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MotDePassePage extends StatefulWidget {
  @override
  _MotDePassePageState createState() => _MotDePassePageState();
}

class _MotDePassePageState extends State<MotDePassePage> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
late SharedPreferences prefs;
  bool _isObscure = true;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }
   void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }


  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }
  

  Future<void> changePassword() async {
    final String oldPassword = _oldPasswordController.text;
    final String newPassword = _newPasswordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      // Gérer le cas où les nouveaux mots de passe ne correspondent pas
      return;
    }
print(prefs.getString("token"));
    var reqbody = {
      // Remplacez par l'email de l'utilisateur connecté
      'email':confirmPassword,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      
    };

    try {
      var res = await http.post(
        Uri.parse(change), // Assurez-vous que changePasswordURL est correctement défini dans config.dart
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(reqbody),
      );

      print(res.statusCode);

      
   print(oldPassword);
   print(newPassword);

     
      if (res.statusCode == 200) {
        print("fdddddddd");
        // Gérer le cas de succès
        // Afficher un message de succès ou rediriger l'utilisateur vers une autre page
      } else {
        // Gérer les autres codes de statut HTTP (erreurs)
      }
    } catch (error) {

      // Gérer les erreurs de connexion ou autres
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Changer le mot de passe',
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _oldPasswordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Mot de passe actuel',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _newPasswordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Nouveau mot de passe',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Confirmer le nouveau mot de passe',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changePassword,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 8),
                  Text('Modifier'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}