import 'package:flutter/material.dart';

//Font Awesome
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//=========WIDGET PRINCIPAL=========
class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color colorGradient1, colorGradient2;

  const IconHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.colorGradient1 = Colors.grey,
    this.colorGradient2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(this.colorGradient1, this.colorGradient2),
        _PlusOpacity(this.icon),
        _TextAndPlusIcon(this.icon, this.title, this.subtitle),
      ],
    );
  }
}

//=========ICON HEADER BACKGROUND=========
class _IconHeaderBackground extends StatelessWidget {
  final Color colorGradient1, colorGradient2;

  const _IconHeaderBackground(this.colorGradient1, this.colorGradient2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
        ),
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [this.colorGradient1, this.colorGradient2]),
      ),
    );
  }
}

//=========PLUS OPACITY=========
class _PlusOpacity extends StatelessWidget {
  final icon;

  const _PlusOpacity(this.icon);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -50,
      top: -50,
      child: FaIcon(this.icon, size: 200, color: Colors.white.withOpacity(0.2)),
    );
  }
}

//=========TEXT AND PLUS ICON=========
class _TextAndPlusIcon extends StatelessWidget {
  final Color whiteOpacity = Colors.white.withOpacity(0.7);
  final IconData icon;
  final String title, subtitle;

//Constructor
  _TextAndPlusIcon(this.icon, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 80),
          Text(
            this.title,
            style: TextStyle(fontSize: 20, color: whiteOpacity),
          ),
          SizedBox(height: 20),
          Text(
            this.subtitle,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: whiteOpacity),
          ),
          SizedBox(height: 20),
          FaIcon(
            this.icon,
            size: 80,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
