import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pfe/confidentialite.dart';
import 'package:pfe/models/device.dart';
import 'package:http/http.dart' as http;
import 'package:pfe/temp.dart';

class appareillespage extends StatefulWidget {
  const appareillespage({Key? key}) : super(key: key);

  @override
  _appareillespageState createState() => _appareillespageState();
}

class _appareillespageState extends State<appareillespage> {
  TextEditingController _addNom = TextEditingController();
  TextEditingController _addTelephone = TextEditingController();
  TextEditingController _addEmail = TextEditingController();
  TextEditingController _addMatricule = TextEditingController();
  TextEditingController _addAdresse = TextEditingController();

  List<Widget> rows = [];

  late Future<List<Devices>> _futureDevices;
  Future<List<Devices>> fetchDevices() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:3000/api/devices'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> devicesData = jsonData['devices'];
      return devicesData.map((json) => Devices.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load devices');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureDevices = fetchDevices();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.7;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appareilles ',
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
      body: FutureBuilder<List<Devices>>(
        future: _futureDevices,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              shrinkWrap: true,
              children: List.generate(
                snapshot.data!.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(18),
                    child: GestureDetector(
                      onTap: () { 
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TempPage(
                              id:snapshot.data![index].sId!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        width: 165,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.battery_charging_full,
                                  size: 30,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 0),
                                Text(
                                  '88 %',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Image.asset(
                              'assets/1.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10),
                            Text(
                              snapshot.data![index].nom.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Connected',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
            // return ListView.builder(
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, index) {
            //     Device device = snapshot.data![index];
            //     return ListTile(
            //       title: Text(device.nom),
            //       subtitle: Text(device.email),
            //     );
            //   },
            // );
          }
        },
      ),
    );
  }

  // Fonction pour construire une ligne avec les données du formulaire
  Widget buildRow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(18),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfiPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              width: 165,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.battery_charging_full,
                        size: 30,
                        color: Colors.green,
                      ),
                      SizedBox(width: 0),
                      Text(
                        '88 %',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/1.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'SFAX',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Connected',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
