import 'package:flutter/material.dart';
import 'dart:math' as Math;

//  https://easings.net/en  Ejemplos Curves

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
      floatingActionButton: Container(
        width: 40,
        height: 40,
        child: screenSize.width < 500
            ? FloatingActionButton(
                onPressed: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back),
              )
            : SizedBox(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

//Estas variables son distintas animaciones, todas las animaciones se adaptan al Duration del controller,
//a menos que se  especifique lo contrario en cada animacion.
  Animation<double>? rotacion;
  Animation<double>? opacidad;
  Animation<double>? opacidadOut;
  Animation<double>? moverDerecha;
  Animation<double>? agrandar;

  @override
  void initState() {
    //El initState solo se ejecuta la primera vez que se construye el widget
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

//| --------Animaciones---------

// Los datos de  Tween(begin, end) se adaptan dependiendo el Transform que se esta usando en el build.
// En .rotate es % , en .translate es en pixeles siendo 0 el lugar donde se encuentra el widget a animar,
// en .scale es multiplicacion puede arrancar en 0 y se agranda  2 veces su tamaño inicial.

    //con pi crea una vuelta perfecta y no se nota cuando se repite el widget
    //.animated(controller)seria sin agregar Curves
    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeOut),
    );

    //Interval es el intervalo de tiempo que va a durar la animacion. Se adapta a la duracion total de la animacion en este caso 4s,e trabaja en base a porcentaje %
    // El tercer argumento de Interval es opcional y sirve para agregarle una curve a la animacion.
    opacidad = Tween(begin: 0.05, end: 1.0).animate(
      CurvedAnimation(
          parent: controller!,
          curve: Interval(0.0, 0.25, curve: Curves.easeOut)),
    ); //traslucido

    opacidadOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    moverDerecha = Tween(begin: 0.0, end: 70.0).animate(
        CurvedAnimation(parent: controller!, curve: Curves.decelerate));

    agrandar = Tween(begin: 0.0, end: 2.0).animate(controller!);

    controller!.addListener(() {
      // print("Status: ${controller!.status}");
      if (controller!.status == AnimationStatus.completed) {
        //controller!.repeat();
        //controller!.reverse();
        //controller!.reset(); // resetea el controllador
      }
      /* else if (controller!.status == AnimationStatus.dismissed) {
        controller!.forward();
      }  */
    });

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

//Que animacion se va a usar
  @override
  Widget build(BuildContext context) {
    controller!.forward();

    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangulo(), //(childRectangulo)
      builder: (BuildContext context, Widget? childRectangulo) {
        //Estados de la animacion, tener en cuenta que consume recursos.
        // print("Opacidad: ${opacidad!.value}");
        //print("Rotacion: ${rotacion!.value}");
        //print("Mover: ${moverDerecha!.value}");
        print("OpacidadOut: ${opacidadOut!.value}");

        return Transform.scale(
          scale: agrandar!.value,
          child: Transform.translate(
            offset: Offset(moverDerecha!.value, 0),
            child: Transform.rotate(
              angle: rotacion!.value,
              child: Opacity(
                opacity: opacidad!.value,
                child: Opacity(
                    opacity: opacidadOut!.value, child: childRectangulo),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.orange),
    );
  }
}
