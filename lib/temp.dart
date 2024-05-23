import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/temp_hum.dart';

class TempPage extends StatefulWidget {
  final String id;
  const TempPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  String? _selectedOption;

  Future<void> updateCategory(String category) async {
    final response = await http.put(
      Uri.parse('http://10.0.2.2:3000/api/devices/${widget.id}/category'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'category': category}),
    );

    if (response.statusCode == 200) {
      print('Device category updated successfully');
    } else {
      print('Failed to update device category');
    }
  }
  Future<List<TempHum>> fetchGetdevice() async {
    final response = await http.get(
      Uri.parse(
        'http://10.0.2.2:3000/api/device/${widget.id}',
      ),
    );

    if (response.statusCode == 200) {
      if (response.body == "[]") {
        return [];
      } else {
        List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((data) => TempHum.fromJson(data)).toList();
      }
    } else {
      print("here22");
      return [];
    }
  }
  Future<List<TempHum>> fetchTempHum() async {
    final response = await http.get(
      Uri.parse(
        'http://10.0.2.2:3000/api/temperature-humidity/device/${widget.id}',
      ),
    );

    if (response.statusCode == 200) {
      if (response.body == "[]") {
        return [];
      } else {
        List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((data) => TempHum.fromJson(data)).toList();
      }
    } else {
      print("here22");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Device',
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
        body: FutureBuilder(
            future: null,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: [
                  SizedBox(
                    height: 240,
                    child: Stack(
                      children: [
                        Container(
                          height: 220, // Ajustez la hauteur selon vos besoins
                          color: Color.fromARGB(255, 66, 236, 231),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Temperature',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      FutureBuilder(
                                          future: fetchTempHum(),
                                          builder: (context, snapshot) {
                                            if (snapshot.data == []) {
                                              return Text(
                                                '0 °C',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              );
                                            } else {
                                              return Text(
                                                '${snapshot.data == [] ? "" : snapshot.data![0].temperature}°C',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              );
                                            }
                                          }),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          50), // Espace entre la température et l'humidité
                                  child: Container(
                                    width: 2, // Largeur de la barre
                                    height: 60, // Hauteur de la barre
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Humidity',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      FutureBuilder(
                                          future: fetchTempHum(),
                                          builder: (context, snapshot) {
                                            if (snapshot.data == []) {
                                              return Text(
                                                '0 %',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              );
                                            } else {
                                              return Text(
                                                '${snapshot.data == [] ? "" : snapshot.data![0].humidity} %',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              );
                                            }
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0,
                                        3), // Changement de l'ombre selon vos besoins
                                  ),
                                ],
                              ),
                              width: 400,
                              height:
                                  70, // Ajustez la hauteur selon vos besoins
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      // Conteneur blanc pour entourer le smiley
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 66, 236, 231),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.sentiment_satisfied_sharp,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Temperature Hot',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                                Offset(0, 3), // changes the shadow as needed
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 250, // Adjust the height as needed
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RadioListTile<String>(
                                title: Text(
                                  'Légumes et Fruits',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: 'legumes_fruits',
                                groupValue: _selectedOption,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedOption = value;
                                    updateCategory(value!);
                                  });
                                },
                              ),
                              SizedBox(height: 10),
                              RadioListTile<String>(
                                title: Text(
                                  'Viandes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: 'viandes',
                                groupValue: _selectedOption,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedOption = value;
                                    updateCategory(value!);
                                  });
                                },
                              ),
                              SizedBox(height: 10),
                              RadioListTile<String>(
                                title: Text(
                                  'Poisson',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                value: 'poisson',
                                groupValue: _selectedOption,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedOption = value;
                                    updateCategory(value!);
                                  });
                                },
                              ),
                            ],
                          )))
                ]);
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
