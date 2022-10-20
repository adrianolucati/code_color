import 'package:flutter/material.dart';

import '../components/widget_bezier.dart'; //importando a classe BezierWidget()
import '../components/widget_bezier2.dart';
import '../components/widget_bezier3.dart';
import 'home_page.dart';

class FlagPage extends StatefulWidget {
  const FlagPage({super.key});

  @override
  State<FlagPage> createState() => _FlagPageState();
}

class _FlagPageState extends State<FlagPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easter Egg Page'),
        actions: const [
          CustomSwitcher(),
        ],
      ),
      body: ListView(
        children: [
          Center(
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
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 200,
              width: 340,
              color: const Color.fromARGB(255, 0, 121, 4),
              child: Center(
                child: Container(
                  height: 150,
                  width: 300,
                  color: const Color.fromARGB(255, 253, 228, 0),
                  child: Center(
                    child: Container(
                      height: 100,
                      width: 250,
                      color: const Color.fromARGB(255, 17, 0, 250),
                      child: const Center(
                        child: Text(
                          'Ordem\n&\nProgresso',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
            width: 350,
          ),
          //https://medium.com/flutter-comunidade-br/flutter-lineto-quadraticbezierto-34a880afa1ef
          SafeArea(
            child: Column(
              children: <Widget>[
                BezierWidget1(), //classe do importe
              ],
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                BezierWidget2(), //classe do importe
              ],
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                BezierWidget3(), //classe do importe
              ],
            ),
          ),
        ],
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
