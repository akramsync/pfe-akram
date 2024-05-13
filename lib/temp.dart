import 'package:flutter/material.dart';

class TempPage extends StatelessWidget {
  final double temperature;
  final double humidity;

  const TempPage({
    Key? key,
    required this.temperature,
    required this.humidity,
  }) : super(key: key);


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
      body: Column(
        children: [
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
                            
                            children:  [
                              
                              Text(
                                
                                'Temperature: $temperature°C',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
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
                            children:  [
                              Text(
                                'Humidity: $humidity%',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              
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
                      height: 70, // Ajustez la hauteur selon vos besoins
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              // Conteneur blanc pour entourer le smiley
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 66, 236, 231),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.sentiment_satisfied_sharp,
                                  color: Color.fromARGB(255, 255, 255, 255),
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
                      Offset(0, 3), // Changement de l'ombre selon vos besoins
                ),
              ],
            ),
            width: double.infinity,
            height: 250, // Ajustez la hauteur selon vos besoins
            child: Center(
              child: Text(
                'Nouveau Container',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
