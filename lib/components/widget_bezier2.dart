import 'package:flutter/material.dart';
//https://medium.com/flutter-comunidade-br/flutter-lineto-quadraticbezierto-34a880afa1ef

class BezierWidget2 extends StatelessWidget {
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

    var controlPoint = Offset(
        ((size.width / 2) / 2),
        ((size.height / 2) /
            2)); //X = ((size.width/2)/2) e Y = ((size.heigth/2)/2) ponto de controle
    var endPoint =
        Offset(size.width, 0); //pontos da reta x= valor máximo e y = 0
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
