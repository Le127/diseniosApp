import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  //controller
  AnimationController? controller;

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller!.addListener(() {
      //  print("Valor controller: ${controller!.value}");

      setState(() {
        porcentaje =
            lerpDouble(porcentaje, nuevoPorcentaje, controller!.value)!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink[400],
        onPressed: () {
          setState(
            () {
              porcentaje = nuevoPorcentaje;
              nuevoPorcentaje += 10;
              if (nuevoPorcentaje > 100) {
                nuevoPorcentaje = 0;
                porcentaje = 0;
              }
              controller!.forward(from: 0.0);
            },
          );
        },
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(5),
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: _MyRadialProgress(porcentaje: porcentaje),
            )),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final porcentaje;
  _MyRadialProgress({this.porcentaje});

  @override
  void paint(Canvas canvas, Size size) {
    //Circulo -- lapiz
    //los .. hacen referencia al paint, evita reescribir paint.color, paint.style, etc..
    final paint = Paint()
      ..strokeWidth = 6
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //arco  --lapiz
    final paintBow = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    //Parte que se va a rellenar
    double bowAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(

        //rect -> el espacio donde queremos ubicar el arco de relleno
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2, //angulo inicial
        bowAngle, //angulo de llenado
        false,
        paintBow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
