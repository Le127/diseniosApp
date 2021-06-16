import 'package:disenios_app/src/theme/themechanger.dart';
import 'package:flutter/material.dart';

import 'package:disenios_app/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
              CustomRadialProgress(
                  porcentaje: porcentaje * 1.5, color: Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                  porcentaje: porcentaje * 1.7, color: Colors.pink),
              CustomRadialProgress(
                  porcentaje: porcentaje * 1.4, color: Colors.deepPurple),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  porcentaje = porcentaje + 10;

                  if (porcentaje > 100) {
                    porcentaje = 0.0;
                  }
                });
              },
              child: Icon(Icons.refresh)),
        ],
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

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  //Constructor
  const CustomRadialProgress({
    required this.porcentaje,
    required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: appTheme.backgroundColor,
        strokePrimario: 7,
        strokeSecundario: 10,
      ),
    );
  }
}
