import 'package:flutter/material.dart';
import 'package:parkingapplication/Pages/qr_page.dart';
import '../main.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';




class FormPage extends StatefulWidget{
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPage();
}

class _FormPage extends State<FormPage>{
  static const String _num = '2540127856'; //Take from data
  static final List<String> data = 
  ["Select Vehicle",
    "Car 1",
  "Car 2",
  "Motorcycle"];
  static List<String> plate = [
    "Plate",
    "B 0001 BBB",
    "B 0002 CCC",
    "B 0003 DDD"];
  static List<String> color = [
    "Color",
    "Black",
    "White",
    "Red"
  ];

  static String vehicle = data[0];
  static int index = data.indexOf(vehicle);
  static String cchose = "Color";
  static String pchose = "Plate";

  String setValue(String num, String pchose, String timestr){
    return '$num#$pchose#$timestr';
  }

  void input(){
    print(_num);
    print(vehicle);
    print(cchose);
    print(pchose);

    DateTime time = DateTime.now();
    String timestr = "${time.day}-${time.month}-${time.year}#${time.hour}:${time.minute}:${time.second}";

    String value = setValue(_num, pchose, timestr);


    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return QrPage(v:value);
          }));
  }

  void homebtn(){
    setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return const HomePage(title: 'Binus Parking',);
          }));
   });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('BINUS Parking'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Please Fill-in This form',
              style: TextStyle(fontSize: 25)
            ),
            const SizedBox(
              width: 250,
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: _num,
                )
              ),
            ),
            SizedBox(
              width: 250,
              child: DropdownButton(
                  value: vehicle,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  isExpanded: true,
                  items: data.map(
                    (valueItem){
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                        );
                    }
                  )
                      .toList(),

                  onChanged: (value){
                    setState(() {
                      vehicle = value!;
                      index = data.indexOf(vehicle);
                      cchose = color[index];
                      pchose = plate[index];
                    });
                  },
                ),
            ),
            Container(
              width: 250,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1
                )
              ),
              child: Text(
                pchose,
                style: const TextStyle(fontSize: 17),
              ),
            ),
            Container(
              width: 250,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1
                )
              ),
              child: Text(
                cchose,
                style: const TextStyle(fontSize: 17),
              ),
            ),
            ElevatedButton(
              onPressed: input,
              child: const Icon(Icons.add_task)
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homebtn,
        child: const Icon(Icons.home),
        ),
    );
  }
}