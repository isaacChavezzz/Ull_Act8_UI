import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //https://source.unsplash.com/random

  File file = File("Users/user/Downloads/xs.jpg");

  Uint8List? imageByteData;

  void _getImage() async {
    Uint8List data = (await rootBundle.load('Users/user/Downloads/xs.jpg'))
        .buffer
        .asUint8List();

    setState(() {
      print(data);
      imageByteData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _getImage();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TELCEL",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Telcel'),
        ),
        body: Container(
          color: Colors.grey,
          child: Image.asset(
            'assets/tela.png',
            width: 300,
            height: 300,
            fit: BoxFit.contain,
            frameBuilder: (context, child, frame, loaded) {
              if (loaded) {
                return child;
              }
              return AnimatedOpacity(
                child: child,
                opacity: frame == null ? 0 : 1,
                duration: Duration(seconds: 1),
                curve: Curves.easeOut,
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Text('Imagen no encontrada'),
              );
            },
          ),

          //child: Image.network(
          //'https://source.unsplash.com/random',
          //width: 300,
          //height: 300,
          //fit: BoxFit.contain,
          //frameBuilder: (context, child, frame, loaded) {
          //if (loaded) {
          //return child;
          //}
          //return AnimatedOpacity(
          //child: child,
          //opacity: frame == null ? 0 : 1,
          //duration: Duration(seconds: 1),
          //curve: Curves.easeOut,
          //);
          //},
          //errorBuilder: (context, error, stackTrace) {
          //return Center(
          //child: Text('Imagen no encontrada'),
          //);
          //},
          //),

          //child: Image.file(
          //file,
          //width: 300,
          //height: 300,
          //fit: BoxFit.contain,
          //frameBuilder: (context, child, frame, loaded) {
          //if (loaded) {
          //return child;
          //}
          //return AnimatedOpacity(
          //child: child,
          //opacity: frame == null ? 0 : 1,
          //duration: Duration(seconds: 1),
          //curve: Curves.easeOut,
          //);
          //},
          //errorBuilder: (context, error, stackTrace) {
          //return Center(
          //child: Text('Imagen no encontrada'),
          //);
          //},
          //),

          //child: Image.memory(
          //imageByteData!,
          //width: 300,
          //height: 300,
          //fit: BoxFit.contain,
          //frameBuilder: (context, child, frame, loaded) {
          //if (loaded) {
          //return child;
          //}
          //return AnimatedOpacity(
          //child: child,
          //opacity: frame == null ? 0 : 1,
          //duration: Duration(seconds: 1),
          //curve: Curves.easeOut,
          //);
          //},
          //errorBuilder: (context, error, stackTrace) {
          //return Center(
          //child: Text('Imagen no encontrada'),
          //);
          //},
          //),
        ),
      ),
    );
  }
}
