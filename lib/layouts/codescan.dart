import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:audioplayers/audio_cache.dart';

class Scancode extends StatefulWidget {
  @override
  _Scancode createState() => _Scancode();
}

class _Scancode extends State<Scancode> {
  var scanResult = "";
  final playSound = AudioCache();
  Widget coda;
  Widget codex;

  void scanCodeNow() async {
    String scanCodes = await FlutterBarcodeScanner.scanBarcode("red", "cancel", true, ScanMode.QR);
    setState(() {
      scanResult = scanCodes.toString();
      if (scanResult == "-1") {
        scanResult = "Not available";
        coda = img();
        codex = text();
        playSound.play("errorSound.wav");
      } else {
        coda = text();
        codex = null;
        playSound.play("okSound.wav");
      }
    });
  }

  Container contain(Widget coda){
    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 100.0),
        child: coda
    );
  }

  Container container(Widget codex){
    return Container(
        child: codex
    );
  }

  Image img(){
    return Image.asset('images/scan.png');
  }

  Text text(){
    return Text(
      "Result: $scanResult",
      style: TextStyle(
        fontSize: 20.0,
      ),);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.filter_list, size: 30.0,),
              SizedBox(width: 20.0,),
              Text("C.O.D.E Scanner", style: TextStyle(fontSize: 25.5),),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              contain(coda),
              container(codex),
              Container(
                width: 390,
                height: 50,
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    scanCodeNow();
                  },
                  elevation: 3.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.search, size: 30.5, color: Colors.white,),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Scan Code", style: TextStyle(fontSize: 30.0, color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
