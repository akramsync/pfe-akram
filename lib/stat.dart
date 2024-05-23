import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pfe/acceuile.dart';

List<double> weeklySummary = [
  4.40,
  2.50,
  42.42,
  10.50,
  100.20,
  88.99,
  90.10,
];

class Legend extends StatelessWidget {
  final Color color;
  final String text;

  const Legend({Key? key, required this.color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class Statpage extends StatefulWidget {
  const Statpage({super.key});

  @override
  State<Statpage> createState() => _statpageState();
}

class _statpageState extends State<Statpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statistique',
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
      body:  
       Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Bar Chart Title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25),
                  Expanded(
                    child: MyBarGraph(weeklySummary: weeklySummary),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Bar Chart Title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                  
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top:50)),
                      Legend(color: Colors.green, text: 'Connected'),
                      SizedBox(width: 20),
                      Legend(color: Colors.red, text: 'Disconnected'),
                    ],
                  ),
                  SizedBox(height: 0),
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: 70,
                            color: Colors.green,
                          ),
                          PieChartSectionData(
                            value: 30,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
              SizedBox(height: 70), // Ajout de l'espace de 50 pixels

        ],
      ),  

    );
  }
}
