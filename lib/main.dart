import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pfe/acceuile.dart';
import 'package:pfe/addpage.dart';
import 'package:pfe/appareilles.dart';
import 'package:pfe/signin.dart';
import 'package:pfe/splach.dart';
import 'package:pfe/stat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage());
  }
}

class NavigationExample extends StatefulWidget {
  final token;

  const NavigationExample({@required this.token, Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  onDestinationSelected(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Scaffold(
      
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          ).then((value) {
            setState(() {});
          });
        },
        backgroundColor: Color.fromARGB(255, 214, 230, 233),
        shape: CircleBorder(), // Rend le bouton circulaire

        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: Color.fromARGB(255, 214, 230, 233),
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () {
                onDestinationSelected(
                  0,
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.phone_iphone,
                color: Colors.black,
              ),
              onPressed: () {
                onDestinationSelected(
                  1,
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.signal_cellular_alt,
                color: Colors.black,
              ),
              onPressed: () {
                onDestinationSelected(
                  2,
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                onDestinationSelected(
                  3,
                );
              },
            ),
          ],
        ),
      ),
      body: <Widget>[
        AccueilPage(),

        /// appareils page
        appareillespage(),

        /// stat page
        Statpage(),

        /// seetting page
        SettingsPage(),
      ][currentPageIndex],
    );
  }
}
