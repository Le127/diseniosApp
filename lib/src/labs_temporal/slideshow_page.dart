import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:disenios_app/src/models/slider_model.dart';

class SlideShowPageTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Conectamos el Provider con el SliderModel
    return ChangeNotifierProvider(
      create: (_) {
        return SliderModel();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: _Slides()),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

//Todos los Slides
class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final PageController pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      //print("Pagina actual: ${pageViewController.page}");

      //Actualizar el provider, en este caso la clase SliderModel creada en /models
      //De esta forma tenemos acceso a todas las caracteristicas de la clase SliderModel
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: [
          _Slide("assets/svg/1.svg"),
          _Slide("assets/svg/2.svg"),
          _Slide("assets/svg/3.svg"),
        ],
      ),
    );
  }
}

//Cada Slide
class _Slide extends StatelessWidget {
  final String? svgImage;

  const _Slide(this.svgImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svgImage!),
    );
  }
}

//Todos los puntos
class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

//Cada punto
class _Dot extends StatelessWidget {
  //crea el parametro
  final int index;

  //Requiere el parametro
  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 13,
      height: 13,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? Colors.orange
            : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
