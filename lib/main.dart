import 'package:flutter/material.dart';
import 'package:scanner/pages/home.page.dart';
import 'package:scanner/widget/CounterStorage.widget.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      routes: {
        "/": (context)=>Home(storage: CounterStorage()),
      },
    );
  }
}
