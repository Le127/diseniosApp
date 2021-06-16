import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  //Declaraciones
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double strokePrimario;
  final double strokeSecundario;

  //Constructor
  const RadialProgress({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.strokePrimario = 10,
    this.strokeSecundario = 6,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double? porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller!,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(
              (widget.porcentaje - diferenciaAnimar) +
                  (diferenciaAnimar * controller!.value),
              widget.colorPrimario,
              widget.colorSecundario,
              widget.strokePrimario,
              widget.strokeSecundario,
            ),
          ),
        );
      },
    );
  }
}

//Dibujo
class _MyRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double strokePrimario;
  final double strokeSecundario;

  _MyRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.strokePrimario,
    this.strokeSecundario,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: Offset(0, 0), radius: 180);

    final Gradient gradiente = LinearGradient(
        colors: [Color(0xffc012FFF), Color(0xff6D05E8), Colors.red]);

    //Circulo -- lapiz
    //los .. hacen referencia al paint, evita reescribir paint.color, paint.style, etc..
    final paint = Paint()
      ..strokeWidth = strokeSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //arco  --lapiz
    final paintBow = Paint()
      ..strokeWidth = strokePrimario
      //..color = colorPrimario
      ..shader = gradiente.createShader(rect) //para agregar el gradiente
      ..strokeCap = StrokeCap.round
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
