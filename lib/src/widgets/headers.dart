import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
      ),
    );
  }
}

//-----------------HEADER DIAGONAL---------------------
class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
// (x,y)  x---> Horizontal    y ---> Vertical

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); //herramienta de dibujo
    final path = Path(); //trayectoria de la herramienta

    //Propiedades del lapiz
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //stroke ->trazo    , .fill -> rellenar
    lapiz.strokeWidth = 10;

    //Path o trayectoria del lapiz

    path.moveTo(0, size.height * 0.30); // mover el lapiz sin dibujar
    path.lineTo(size.width, size.height * 0.25); //mover el lapiz dibujando
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //Ordena dibujar lo escrito en el Path
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
//-----------------------------------------------

//-----------------HEADER TRIANGULAR---------------------
class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
// (x,y)  x---> Horizontal    y ---> Vertical

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); //herramienta de dibujo
    final path = Path(); //trayectoria de la herramienta

    //Propiedades del lapiz
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //stroke ->trazo    , .fill -> rellenar
    lapiz.strokeWidth = 10;

    //Path o trayectoria del lapiz

    //path.lineTo(size.width, size.height); //mover el lapiz dibujando
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    //Invertido
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    //Ordena dibujar lo escrito en el Path
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//-----------------HEADER PICO---------------------
class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sizeW = size.width;
    double sizeH = size.height;

    final paint = Paint();
    final path = Path();

    //paint props
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    //path
    path.lineTo(0, sizeH * 0.2);
    path.lineTo(sizeW * 0.5, sizeH * 0.25);
    path.lineTo(sizeW, sizeH * 0.2);
    path.lineTo(sizeW, 0);

    //Orden canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//-----------------HEADER CURVO---------------------
class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sizeW = size.width;
    double sizeH = size.height;

    final paint = Paint();
    final path = Path();

    //paint props
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    //path
    path.lineTo(0, sizeH * 0.2);
    path.quadraticBezierTo(sizeW * 0.5, sizeH * 0.35, sizeW, sizeH * 0.2);
    path.lineTo(sizeW, 0);

    //Invertido
/*     path.lineTo(0, sizeH * 0.2);
    path.quadraticBezierTo(sizeW * 0.5, sizeH * 0.1, sizeW, sizeH * 0.2);
    path.lineTo(sizeW, 0); */

    //Orden canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//-----------------HEADER WAVE---------------------
class HeaderWave extends StatelessWidget {
  final Color color;

  const HeaderWave({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(this.color),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  final Color color;

  _HeaderWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    double sizeW = size.width;
    double sizeH = size.height;

    final paint = Paint();
    final path = Path();

    //paint props
    paint.color = this.color; //Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 15;

    //path arriba

    path.lineTo(0, sizeH * 0.2);
    path.quadraticBezierTo(sizeW * 0.25, sizeH * 0.3, sizeW * 0.5, sizeH * 0.2);
    path.quadraticBezierTo(sizeW * 0.75, sizeH * 0.1, sizeW, sizeH * 0.2);
    path.lineTo(sizeW, 0);

    //path abajo
    path.moveTo(0, sizeH);
    path.lineTo(0, sizeH * 0.8);
    path.quadraticBezierTo(sizeW * 0.25, sizeH * 0.7, sizeW * 0.5, sizeH * 0.8);
    path.quadraticBezierTo(sizeW * 0.75, sizeH * 0.9, sizeW, sizeH * 0.8);
    path.lineTo(sizeW, sizeH);

    //Orden canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
