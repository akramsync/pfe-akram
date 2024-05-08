import 'dart:convert';
import 'package:pfe/acceuile.dart';
import 'package:pfe/config.dart';
import 'package:pfe/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:pfe/signup.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

void main() {
  runApp(MaterialApp(
    home: SignInPage(),
  ));
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailcontoller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  bool _isNotValidate = false;

  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {


  if (emailcontoller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
    var reqbody = {
      "email": emailcontoller.text,
      "password": passwordcontroller.text
    };
    

    try {
      var res = await http.post(Uri.parse(login), // Utilisez l'URL de connexion de votre backend
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(reqbody));
      var jsonResponse = jsonDecode(res.body);

      print(res.statusCode);

      if (res.statusCode == 200) {
        // Connexion réussie
        // Enregistrez le jeton dans SharedPreferences
        prefs.setString('token', jsonResponse['token']);

        // Naviguez vers la page d'accueil ou toute autre page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>NavigationExample()),
        );
      }  else {
        // Échec de la connexion
        showDialog(
          context: context,
          builder: (BuildContext context) {   
            return AlertDialog(
              title: Text('Error'),
              content: Text(jsonResponse['message']),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  } else {
    setState(() {
      _isNotValidate = true;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Add the logo here
              Image.asset(
                'assets/1.png', // Path to your image
                height: 200, // Adjust the height as needed
                width: 100, // Adjust the width as needed
              ),

              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 25, // Définir la taille du texte à 20
                  fontWeight:
                      FontWeight.bold, // Définir le style de texte en gras
                  color: Colors.black, // Définir la couleur du texte en noir
                ),
              ),
              SizedBox(height: 20),

              TextFormField(
                controller: emailcontoller,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _isNotValidate ? "enter proper info" : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  errorText: _isNotValidate ? "enter proper info" : null,
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), // Customize the border radius
                  border: Border.all(
                      color: Color.fromARGB(255, 77, 219, 255),
                      width: 1), // Customize the border color and width
                ),
                child: ElevatedButton(
                  onPressed: () {
                    loginUser();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0, // Remove the button shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Match the border radius with the container
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity, // Make the button full width
                    padding: EdgeInsets.symmetric(
                        vertical: 15), // Adjust the vertical padding
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ), // Customize the button text size
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),
              TextButton(
                onPressed: () {},
                child: Text('Forget password?'),
              ),

              SizedBox(height: 5),
              Row(
                children: const [
                  Expanded(
                    child: Divider(color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'or',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.black),
                  ),
                ],
              ),

              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signuppage()),
                  );
                },
                child: Text(
                  'Don`t have an account? Sign Up',
                  style: TextStyle(
                    fontSize: 14,

                    color: Colors.black, // Customize the button text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
