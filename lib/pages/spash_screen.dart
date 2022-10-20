import 'dart:async';
import 'package:code_color/design_system/my_images.dart';
import 'package:flutter/material.dart';
// void main() {
// runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return MaterialApp(
// 	title: 'Splash Screen',
// 	theme: ThemeData(
// 		primarySwatch: Colors.green,
// 	),
// 	home: SpashScreen(),
// 	debugShowCheckedModeBanner: false,
// 	);
// }
// }

class SpashScreen extends StatefulWidget {
  @override
  _SpashScreenState createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/user'));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        width: 300,
        height: 300,
        // color: Colors.white,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageColors), fit: BoxFit.contain)),
      ),
    );
    // child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
// class SecondScreen extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return Scaffold(
// 	appBar: AppBar(title:const Text("GeeksForGeeks")),
// 	body: const Center(
// 		child:Text("Home page",textScaleFactor: 2,)
// 	),
// 	);
// }
// }
