import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scanner/widget/CounterStorage.widget.dart';
import 'dart:io';
 
class Home extends StatefulWidget {
  const Home({super.key, required this.storage});
  @override
  State<Home> createState() => _HomeState();
  final CounterStorage storage;
}

class _HomeState extends State<Home> {
  String valueScan="";
  String s="";
  void _readFile() {
    widget.storage.readCounter().then((value) {
       setState(() {
         s = value;
      });
    });
  }

  Future<File> _writeFile(String value) {
    // Write the variable as a string to the file.
    return widget.storage.writeCounter(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Thalès Scanner => $s"),
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
                    scanMe();
                      _writeFile(valueScan);

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
                    _readFile();
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

  Future<void> scanMe  () async{
      try{
       await FlutterBarcodeScanner.scanBarcode(
            "#2A99CF",
            "cancel",
            true,
            ScanMode.BARCODE).then((value){
               setState((){
                valueScan=value;
              });


              FutureOr<String> f="";
               return f;
            });

      }catch(e){
        rethrow;
      }
  }

}

