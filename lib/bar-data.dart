import 'package:pfe/individual-bar.dart';

class Bardata{
  final double sunAmount;
   final double monAmount;
    final double tueAmount;
     final double wedAmount;
      final double thurAmount;
       final double friAmount;
         final double satAmount;
         Bardata({
         required this.sunAmount,
         required this.monAmount,
         required this.tueAmount,
         required this.wedAmount,
         required this.thurAmount,
         required this.friAmount,
         required this.satAmount,

         });
         List<individualbar> bardata = [];
         void initializebardata(){
          bardata = [
            individualbar(x: 0,y: sunAmount),
             individualbar(x: 1,y: monAmount),
              individualbar(x: 2,y: tueAmount),
               individualbar(x: 3,y: wedAmount),
                individualbar(x: 4,y: thurAmount),
                 individualbar(x: 5,y: friAmount),
                  individualbar(x: 6,y: satAmount),

          ];
         }
}