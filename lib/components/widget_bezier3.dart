import 'package:flutter/material.dart';
//https://medium.com/flutter-comunidade-br/flutter-lineto-quadraticbezierto-34a880afa1ef

class BezierWidget3 extends StatelessWidget {
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

    path.lineTo(0.0, size.height);

    var firstControlPoint =
        Offset(size.width / 4, size.height / 2); //Primeiro ponto de controle
    var firstEndPoint =
        Offset(size.width / 2, size.height / 2); //endPonit na reta
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width, size.height / 2); //Segundo ponto de controle
    var secondEndPoint = Offset(size.width, 0); //endPonit na reta
    // path.lineTo(size.width, 0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
