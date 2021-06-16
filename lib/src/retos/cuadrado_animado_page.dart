import 'package:flutter/material.dart';

//Build Principal
class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(50),
          alignment: Alignment.centerLeft,
          child: _CuadradoAnimado()),
    );
  }
}

//Widget _CuadradoAnimado(),
class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  //Controller
  AnimationController? controller;

  //Animaciones
  Animation<double>? toRigth;
  Animation<double>? toTop;
  Animation<double>? toLeft;
  Animation<double>? toBottom;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));

    toRigth = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    toTop = Tween(begin: 0.0, end: -200.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.25, 0.50, curve: Curves.bounceOut)));

    toLeft = Tween(begin: 0.0, end: -200.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.50, 0.75, curve: Curves.easeInBack)));

    toBottom = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        parent: controller!, curve: Interval(0.75, 1.0, curve: Curves.ease)));

    controller!.addListener(() {
      if (controller!.status == AnimationStatus.completed) {
        controller!.reset();
        controller!.repeat();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward();

    return AnimatedBuilder(
        animation: controller!,
        child: _Rectangulo(), //childRectangulo
        builder: (BuildContext context, Widget? childRectangulo) {
//el return se podria resumir como
//transform.translate(offset:Offset(toRigth.value + toLeft.value,toTop.value+toBottom.value))

          return Transform.translate(
            offset: Offset(toRigth!.value, 0.0),
            child: Transform.translate(
              offset: Offset(0.0, toTop!.value),
              child: Transform.translate(
                offset: Offset(toLeft!.value, 0.0),
                child: Transform.translate(
                    offset: Offset(0.0, toBottom!.value),
                    child: childRectangulo),
              ),
            ),
          );
        });
  }
}

//Widget _Rectangulo usado en el build del State
class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(color: Colors.orange),
    );
  }
}
