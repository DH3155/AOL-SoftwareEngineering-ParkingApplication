import 'package:flutter/material.dart';
import 'package:parkingapplication/main.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget{
  final String v;
  const QrPage ({Key? key, required this.v}) : super(key:key);

  @override
  State<QrPage> createState() => _QrPage();
}

class _QrPage extends State<QrPage>{
  
  void homebtn(){
    setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return const HomePage(title: 'Binus Parking',);
          }));
   });
  }
    @override
  Widget build(BuildContext context){
    String value = widget.v;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BINUS Parking')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child:QrImageView(
                data: value,
                version: QrVersions.auto,
                size: 320,
                gapless: false
                )
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