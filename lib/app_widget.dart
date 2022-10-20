import 'package:flutter/material.dart';
import 'app_controller.dart';
import 'pages/flag.dart';
import 'pages/home_page.dart';
import 'pages/login_page_password.dart';
import 'pages/login_page_user.dart';
import 'pages/spash_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Center(
  //       child: Text(
  //         title,
  //         textDirection: TextDirection.ltr,
  //         style: TextStyle(color: Colors.white, fontSize: 50),
  //       ),
  //     ),
  //   );
  // }

  // int alpha = AppController.instance.color.alpha;
  // int red = AppController.instance.color.red;
  // int blue = AppController.instance.color.blue;
  // int green = AppController.instance.color.green;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: buildMaterialColor(AppController.instance.color),
            brightness: AppController.instance.isDartTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          // home: const LoginPageUser(),
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => SpashScreen(),
            '/user': (context) => const LoginPageUser(),
            '/pass': (context) => LoginPagePassword(),
            '/home': (context) => HomePage(),
            '/flag': (context) => const FlagPage(),
          },
        );
      },
    );
  }
}

//https://stackoverflow.com/questions/62432229/how-to-assign-hexadecimal-color-code-in-primaryswatch-in-flutter
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
