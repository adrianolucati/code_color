import 'package:flutter/material.dart';
//https://medium.com/flutter-comunidade-br/flutter-lineto-quadraticbezierto-34a880afa1ef

class BezierWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipHome(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.7,
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFFf9a45f), Color(0xFFf86a5c)]),
        ),
      ),
    );
  }
}

class ClipHome extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height); //posição de x= 0  e y = o valor máximo

    path.lineTo(size.width, 0); //posição de x= o valor máximo e y = 0
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
