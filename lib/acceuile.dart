import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pfe/temp.dart';
import 'bar-data.dart';

List<double> weeklySummary = [
  4.40,
  2.50,
  42.42,
  10.50,
  100.20,
  88.99,
  90.10,
];

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              Colors.transparent, // Rendre la couleur de l'appbar transparente
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
          // Vous pouvez ajouter d'autres éléments à l'appbar ici, comme le titre

          // Icône en haut à gauche
          centerTitle: true, // Centrer le titre de l'appbar
          elevation: 0, // Supprimer l'ombre de l'appbar
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications, // Icône des notifications
                color: Colors.black, // Couleur de l'icône
              ),
              onPressed: () {
                // Ajoutez la logique pour gérer le clic sur l'icône de notification ici
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Card(
            shadowColor: Colors.transparent,
            color: Color.fromRGBO(230, 229, 228, 0.8),
            margin: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft *
                      0.9, // Aligner le texte en haut et à gauche
                  child: Padding(
                    padding:
                        const EdgeInsets.all(8.0), // Ajouter un peu de padding
                    child: Text(
                      'Hello Karim',
                      style: TextStyle(
                        fontSize: 25, // Définir la taille du texte à 20
                        fontWeight: FontWeight
                            .bold, // Définir le style de texte en gras
                        color:
                            Colors.black, // Définir la couleur du texte en noir
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: MyBarGraph(weeklySummary: weeklySummary),
                  ), // Utilisez MyBarGraph ici
                ),
                Align(
                  alignment: Alignment.topLeft *
                      0.9, // Aligner le texte en haut et à gauche
                  child: Padding(
                    padding:
                        const EdgeInsets.all(8.0), // Ajouter un peu de padding
                    child: Text(
                      'Appareilles',
                      style: TextStyle(
                        fontSize: 25, // Définir la taille du texte à 20
                        fontWeight: FontWeight
                            .bold, // Définir le style de texte en gras
                        color:
                            Colors.black, // Définir la couleur du texte en noir
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TempPage(temperature: 0.0, humidity: 0.0)),
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
                                offset: Offset(0,
                                    3), // Changement de l'ombre selon vos besoins
                              ),
                            ],
                          ),
                          width: 165,
                          height: 250, // Ajustez la hauteur selon vos besoins
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons
                                        .battery_charging_full, // Utilisation de l'icône battery_charging_full
                                    size:
                                        30, // Ajustez la taille de l'icône selon vos besoins
                                    color: Colors.green, // Couleur de l'icône
                                  ),
                                  SizedBox(
                                      width:
                                          0), // Espace entre l'icône et le texte
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
                              SizedBox(
                                  height:
                                      10), // Espace entre le texte et l'image suivante
                              Image.asset(
                                'assets/1.png', // Chemin de votre image
                                width:
                                    100, // Ajustez la largeur de l'image selon vos besoins
                                height:
                                    100, // Ajustez la hauteur de l'image selon vos besoins
                                fit: BoxFit
                                    .cover, // Ajustez la façon dont l'image est ajustée à la boîte
                              ),
                              SizedBox(
                                  height:
                                      10), // Espace entre l'image et le texte suivant
                              Text(
                                'SFAX',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // Espace entre le texte 2 et le texte 3
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
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TempPage(temperature: 0.0, humidity: 0.0)),
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
                                offset: Offset(0,
                                    3), // Changement de l'ombre selon vos besoins
                              ),
                            ],
                          ),
                          width: 165,
                          height: 250, // Ajustez la hauteur selon vos besoins
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons
                                        .battery_charging_full, // Utilisation de l'icône battery_charging_full
                                    size:
                                        30, // Ajustez la taille de l'icône selon vos besoins
                                    color: Colors.green, // Couleur de l'icône
                                  ),
                                  SizedBox(
                                      width:
                                          0), // Espace entre l'icône et le texte
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
                              SizedBox(
                                  height:
                                      10), // Espace entre le texte et l'image suivante
                              Image.asset(
                                'assets/1.png', // Chemin de votre image
                                width:
                                    100, // Ajustez la largeur de l'image selon vos besoins
                                height:
                                    100, // Ajustez la hauteur de l'image selon vos besoins
                                fit: BoxFit
                                    .cover, // Ajustez la façon dont l'image est ajustée à la boîte
                              ),
                              SizedBox(
                                  height:
                                      10), // Espace entre l'image et le texte suivant
                              Text(
                                'SFAX',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // Espace entre le texte 2 et le texte 3
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
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TempPage(temperature: 0.0, humidity: 0.0)),
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
                                offset: Offset(0,
                                    3), // Changement de l'ombre selon vos besoins
                              ),
                            ],
                          ),
                          width: 165,
                          height: 250, // Ajustez la hauteur selon vos besoins
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons
                                        .battery_charging_full, // Utilisation de l'icône battery_charging_full
                                    size:
                                        30, // Ajustez la taille de l'icône selon vos besoins
                                    color: Colors.green, // Couleur de l'icône
                                  ),
                                  SizedBox(
                                      width:
                                          0), // Espace entre l'icône et le texte
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
                              SizedBox(
                                  height:
                                      10), // Espace entre le texte et l'image suivante
                              Image.asset(
                                'assets/1.png', // Chemin de votre image
                                width:
                                    100, // Ajustez la largeur de l'image selon vos besoins
                                height:
                                    100, // Ajustez la hauteur de l'image selon vos besoins
                                fit: BoxFit
                                    .cover, // Ajustez la façon dont l'image est ajustée à la boîte
                              ),
                              SizedBox(
                                  height:
                                      10), // Espace entre l'image et le texte suivant
                              Text(
                                'SFAX',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // Espace entre le texte 2 et le texte 3
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
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TempPage(temperature: 0.0, humidity: 0.0)),
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
                                offset: Offset(0,
                                    3), // Changement de l'ombre selon vos besoins
                              ),
                            ],
                          ),
                          width: 165,
                          height: 250, // Ajustez la hauteur selon vos besoins
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons
                                        .battery_charging_full, // Utilisation de l'icône battery_charging_full
                                    size:
                                        30, // Ajustez la taille de l'icône selon vos besoins
                                    color: Colors.green, // Couleur de l'icône
                                  ),
                                  SizedBox(
                                      width:
                                          0), // Espace entre l'icône et le texte
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
                              SizedBox(
                                  height:
                                      10), // Espace entre le texte et l'image suivante
                              Image.asset(
                                'assets/1.png', // Chemin de votre image
                                width:
                                    100, // Ajustez la largeur de l'image selon vos besoins
                                height:
                                    100, // Ajustez la hauteur de l'image selon vos besoins
                                fit: BoxFit
                                    .cover, // Ajustez la façon dont l'image est ajustée à la boîte
                              ),
                              SizedBox(
                                  height:
                                      10), // Espace entre l'image et le texte suivant
                              Text(
                                'SFAX',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // Espace entre le texte 2 et le texte 3
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
                ),
              ],
            ),
          ),
        ));
  }
}

class MyBarGraph extends StatelessWidget {
  final List<double> weeklySummary;

  const MyBarGraph({
    Key? key,
    required this.weeklySummary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Bardata myBarData = Bardata(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      tueAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thurAmount: weeklySummary[4],
      friAmount: weeklySummary[5],
      satAmount: weeklySummary[6],
    );
    myBarData.initializebardata();

    return BarChart(
      BarChartData(
        maxY: 100, // Définir la hauteur maximale du graphique
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          leftTitles: SideTitles(
            showTitles: false, // Masquer les titres sur le côté gauche
          ),
          rightTitles: SideTitles(
            showTitles: false, // Masquer les titres sur le côté droit
          ),
          topTitles: SideTitles(
            showTitles: false, // Masquer les titres en haut
          ),
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: getBottomTitles, // Masquer les titres en haut
          ),
        ),
        barGroups: myBarData.bardata
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    y: data.y,
                    colors: [Colors.grey[800]!],
                    width: 25,
                    borderRadius: BorderRadius.circular(4),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      y: 100,
                      colors: [Colors.grey[200]!],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  String getBottomTitles(double value) {
    switch (value.toInt()) {
      case 0:
        return 'S';
      case 1:
        return 'M';
      case 2:
        return 'T';
      case 3:
        return 'W';
      case 4:
        return 'T';
      case 5:
        return 'F';
      case 6:
        return 'S';
      default:
        return '';
    }
  }
}
