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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => AddPage()),
      //     );
      //   },
      //   backgroundColor: Colors.black87,
      //   foregroundColor: Colors.yellow,
      //   elevation: 0,
      //   child: Icon(Icons.add),
      // shape: BeveledRectangleBorder(
      //     // borderRadius: BorderRadius.circular(20.0),
      //     // side: BorderSide(color: Colors.blue, width: 2.0, style: BorderStyle.solid)
      //     ),
      // mini: true,
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   notchMargin: 5.0,
      //   shape: CircularNotchedRectangle(),
      //   color: Colors.black87,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(left: 10.0),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             SizedBox(
      //               height: 30,
      //               child: IconButton(
      //                 onPressed: () => onDestinationSelected(
      //                   0,
      //                 ), // Modifier l'index en conséquence
      //                 icon: Icon(
      //                   Icons.home,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //             Text(
      //               "Acceuille",
      //               style: TextStyle(color: Colors.white),
      //             )
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding:
      //             const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             IconButton(
      //               onPressed: () => onDestinationSelected(
      //                 1,
      //               ), // Modifier l'index en conséquence
      //               icon: Icon(
      //                 Icons.phone_iphone,
      //                 color: Colors.white,
      //               ),
      //             ),
      //             Text(
      //               "appareilles",
      //               style: TextStyle(
      //                 color: Colors.white,
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding:
      //             const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             IconButton(
      //               onPressed: () => onDestinationSelected(
      //                 2,
      //               ), // Modifier l'index en conséquence
      //               icon: Icon(
      //                 Icons.signal_cellular_alt,
      //                 color: Colors.white,
      //               ),
      //             ),
      //             Text(
      //               "Stat",
      //               style: TextStyle(color: Colors.white),
      //             )
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(right: 10.0),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             SizedBox(
      //               height: 30,
      //               child: IconButton(
      //                 onPressed: () => onDestinationSelected(
      //                   3,
      //                 ), // Modifier l'index en conséquence
      //                 icon: Icon(
      //                   Icons.settings,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //             Text(
      //               "Setting",
      //               style: TextStyle(color: Colors.white),
      //             )
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
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
