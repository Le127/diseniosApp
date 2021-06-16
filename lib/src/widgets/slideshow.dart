import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//==============Widget Principal==============
class SlideShow extends StatelessWidget {
  final List<Widget>? slides;

  //propiedades opcionales
  final bool upDot;
  final bool circle;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const SlideShow({
    required this.slides,
    this.circle = true,
    this.upDot = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12.0,
    this.bulletSecundario = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return _SlideShowModel();
      },
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideShowModel>(context).colorPrimario =
                  this.colorPrimario;
              Provider.of<_SlideShowModel>(context).colorSecundario =
                  this.colorSecundario;
              Provider.of<_SlideShowModel>(context).bulletPrimario =
                  this.bulletPrimario;
              Provider.of<_SlideShowModel>(context).bulletSecundario =
                  this.bulletSecundario;

              return Column(
                children: [
                  if (this.upDot) _Dots(this.slides!.length),
                  Expanded(
                    child: _Slides(this.slides!),
                  ),
                  if (!this.upDot) _Dots(this.slides!.length),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

//==============TODOS LOS SLIDES==============
class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final PageController pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      //print("Pagina actual: ${pageViewController.page}");
      //Actualizar el provider, en este caso la clase _SlideShowModel
      //De esta forma tenemos acceso a todas las caracteristicas de la clase_SlideShowModel
      Provider.of<_SlideShowModel>(context, listen: false).currentPage =
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
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

//==============UN SLIDE==============
class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

//==============TODOS LOS DOTS==============
class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          this.totalSlides,
          (index) => _Dot(index),
        ),
      ),
    );
  }
}

//==============UN DOT==============
class _Dot extends StatelessWidget {
  //crea el parametro
  final int index;

  //Requiere el parametro
  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    //Podria crear solo una variable sin especificar la propiedad y agregarla donde se la necesite
    //Ej: final  ssModel= final pageViewIndex = Provider.of<_SlideShowModel>(context)
    final pageViewIndex = Provider.of<_SlideShowModel>(context).currentPage;
    final colorPrimario = Provider.of<_SlideShowModel>(context).colorPrimario;
    final colorSecundario =
        Provider.of<_SlideShowModel>(context).colorSecundario;
    final bulletPrimario = Provider.of<_SlideShowModel>(context).bulletPrimario;
    final bulletSecundario =
        Provider.of<_SlideShowModel>(context).bulletSecundario;
    final circle = Provider.of<_SlideShowModel>(context).circle;

    double bulletsSize;
    Color colorBullet;
    if (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) {
      bulletsSize = bulletPrimario;
      colorBullet = colorPrimario;
    } else {
      bulletsSize = bulletSecundario;
      colorBullet = colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: bulletsSize,
      height: bulletsSize,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: colorBullet,
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
      ),
    );
  }
}

//=========MODEL Provider ==========
class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;
  bool _circle = true;

  //GET currentPage
  double get currentPage {
    return this._currentPage;
  }

  //SET currentPage
  set currentPage(double pagina) {
    this._currentPage = pagina;
    notifyListeners();
  }

  //get y set colorPrimario
  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  //get y set colorSecundario
  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  //Getters y Setters bullets
  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double bulletPrimarioSize) {
    this._bulletPrimario = bulletPrimarioSize;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double bulletSecundarioSize) {
    this._bulletSecundario = bulletSecundarioSize;
  }

  bool get circle => this._circle;

  set circle(bool circle) {
    this._circle = circle;
  }
}
