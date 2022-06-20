import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  String valueScan="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Thalès Scanner "),
          centerTitle: true,
        ),

        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                color: Colors.orange,
                elevation: 8,
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: (){
                    ScanMe();
                    VerifierBarCode(valueScan);
                    //Navigator.pushNamed(context, "/scanner");
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: AssetImage('images/scanner.png'),
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 6,),
                      Text("Scanner",style: TextStyle(fontSize: 32,color: Colors.white),),
                      SizedBox(height: 6,)
                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.orange,
                elevation: 8,
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: (){
                    //Navigator.pushNamed(context, "/importer");
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: AssetImage('images/sc.jpg'),
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 6,),
                      Text("Importer",style: TextStyle(fontSize: 32,color: Colors.white),),
                      SizedBox(height: 6,)
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
    );

  }
  void VerifierBarCode( String value){
    var myFile = File('file.txt');
    var sink = myFile.openWrite();
    sink.write('FILE ACCESSED ${DateTime.now()}\n');

    // Close the IOSink to free system resources.
    sink.close();
  }
  Future<void> ScanMe  () async{
    print("hi");
      try{
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#2A99CF",
            "cancel",
            true,
            ScanMode.BARCODE).then((value){
              print(value);
               setState((){
                valueScan=value;
              });
              FutureOr<String> f="";
               return f;
            });
      }catch(e){
        print(e);
        rethrow;
      };
  }

}

