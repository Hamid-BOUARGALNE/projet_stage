import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scanner/widget/CounterStorage.widget.dart';
import 'dart:io';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.storage});
  final CounterStorage storage;
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  String gloabalContent = "";
  String existNotExist = "";
  void _readFile() {
    widget.storage.readCounter().then((value) {
      setState(() {
        gloabalContent = value;
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
      appBar: AppBar(
        title: Text("Thalès Scanner"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            existNotExist,
            style: Theme.of(context).textTheme.headline3,
          ),
          Expanded(
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
                    onTap: () {
                      scanMe(); // scan the barcode
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
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Scanner",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                        SizedBox(
                          height: 6,
                        )
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
                    onTap: () {
                      _readFile();
                      setState(() {
                        existNotExist = gloabalContent;
                      });
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
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Importer",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                        SizedBox(
                          height: 6,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Future<void> scanMe() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#2A79CF", "cancel", true, ScanMode.BARCODE);
    _readFile(); //read all the content of the file
    if (barcodeScanRes != "") {
      var array = gloabalContent.split(';'); //split the global data in the file

      if (array.contains(barcodeScanRes)) {
        FlutterRingtonePlayer.play(fromAsset: "assets/1.mp3");
        setState(() {
          existNotExist = "exist ";
        });
      } else {
        FlutterRingtonePlayer.play(fromAsset: "assets/2.mp3");
        gloabalContent="$gloabalContent;$barcodeScanRes";
        setState(() {
          existNotExist = "Not exist ";
        });
        _writeFile(gloabalContent);
      }
    }
  }
}
