import 'package:flutter/material.dart';
import 'package:scanner/main.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("scanner"),
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
                  onTap: (){},
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
                  onTap: (){},
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
}
