import 'package:flutter/material.dart';
import 'package:parkingapplication/Pages/form_page.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Parking App",
      home: HomePage(title: 'BINUS Parking'),
    );
  }
}

class HomePage extends StatefulWidget{
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  static double cval = 25;
  static double oval = 225;
  static int ovalint = oval.toInt();

  static double percent = oval/250 * 100;
  static int percentint = percent.toInt();

  Map<String, double> dataMap = {
    "Capacity": cval,
    "Occupied" : oval
  };

  void Book(){
    setState(() {  
    oval++;
    cval--;
    ovalint++;

    dataMap ={
      "Capacity": cval,
      "Occupied" : oval
    };

    percent = oval/250 * 100;
    percentint = percent.toInt();
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return const FormPage();
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
              'Good Morning,',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              'John Doe\n',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
        
            PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 1000),
              initialAngleInDegree: -90,
              chartRadius: 250,
              chartType: ChartType.ring,
              ringStrokeWidth: 25,
              centerText: '$percentint%',

              centerTextStyle: const TextStyle(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),

              legendOptions: const LegendOptions(
                showLegends: false
              ),

              chartValuesOptions: const ChartValuesOptions(
                showChartValues: false
              ),
            ),
            Text(
              '$ovalint / 250',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: (Book),
              child: const Text("Book Now"),
            )
          ],       
        ), 
      ),
    );
  }

}


