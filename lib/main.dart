import 'package:flutter/material.dart';
import 'result.dart';
import 'homescreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.black26,
      iconTheme:const IconThemeData(color: Colors.white,) ,
      textTheme:const TextTheme(headline1:
          TextStyle(fontSize: 45,fontWeight: FontWeight.w800,color: Colors.white),
      headline2:
          TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black)
      ) ,
      ),
      home:  const MyHomePage(),
    );
  }
}
