import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../app_controller.dart';
import '../components/custom_switcher.dart';

Color color = Colors.green;

class HomePage extends StatefulWidget {
  static HomePage instance = HomePage();
  String user = '';

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  String user = HomePage.instance.user;

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Center(
  //       child: GestureDetector(
  //         child: Text('Fluterando\n$counter'),
  //         onTap: () {
  //           setState(() {
  //             counter++;
  //           });
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: const [
          CustomSwitcher(),
        ],
      ),
      body: Container(
        // height: double.infinity,
        // width: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text('Usuário: $user'),
                onTap: () {
                  Navigator.of(context).pushNamed('/flag');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: GestureDetector(
                  child: Text(
                    'Contador: $counter',
                    style: const TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                ),
              ),
            ),
            ColorPicker(
                // pickerColor: color, //default color
                onColorChanged: (Color colorSelected) {
                  //on color picked
                  // print('color');
                  AppController.instance.changeColorTheme(color);
                  color = colorSelected;
                },
                pickerColor: color),
            //https://pub.dev/packages/flutter_material_color_picker
            MaterialColorPicker(
              circleSize: 35,
              onColorChange: (Color colorSelected) {
                // Handle color changes
                AppController.instance.changeColorTheme(colorSelected);
                // print(colorSelected);
                color = colorSelected;
              },
              selectedColor: color,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
