import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonFatOption extends StatelessWidget {
  final IconData icon, iconAction;
  final String title;
  final Color colorGradient1,
      colorGradient2,
      titleColor,
      iconColor,
      iconActionColor,
      iconBackgroundColorOpacity;
  final double fontSize, iconSize, iconBackgroundSize;
  final Function onPress;
  final Alignment linearGradientBegin, linearGradientEnd;

  const ButtonFatOption({
    required this.icon,
    required this.title,
    required this.onPress,
    this.iconColor = Colors.white,
    this.iconAction = FontAwesomeIcons.angleRight,
    this.iconActionColor = Colors.white,
    this.iconBackgroundColorOpacity = Colors.white,
    this.titleColor = Colors.white,
    this.fontSize = 20,
    this.iconBackgroundSize = 120,
    this.iconSize = 32,
    this.colorGradient1 = Colors.blue,
    this.colorGradient2 = Colors.blueAccent,
    this.linearGradientBegin = Alignment.centerLeft,
    this.linearGradientEnd = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Stack(
        children: [
          _ButtonBackground(
            colorGradient1: this.colorGradient1,
            colorGradient2: this.colorGradient2,
            icon: this.icon,
            iconBackgroundColorOpacity: this.iconBackgroundColorOpacity,
            iconBackgroundSize: this.iconBackgroundSize,
            linearGradientBegin: this.linearGradientBegin,
            linearGradientEnd: this.linearGradientEnd,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120, width: 30),
              FaIcon(this.icon, size: this.iconSize, color: this.iconColor),
              SizedBox(width: 25),
              Expanded(
                child: Text(
                  this.title,
                  style: TextStyle(
                      color: this.titleColor, fontSize: this.fontSize),
                ),
              ),
              FaIcon(this.iconAction, color: this.iconActionColor),
              SizedBox(width: 28)
            ],
          ),
        ],
      ),
    );
  }
}

// ======BUTTON BACKGROUND======
class _ButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color colorGradient1, colorGradient2, iconBackgroundColorOpacity;
  final Alignment linearGradientBegin, linearGradientEnd;

  final double iconBackgroundSize;

  const _ButtonBackground({
    required this.colorGradient1,
    required this.colorGradient2,
    required this.icon,
    required this.iconBackgroundColorOpacity,
    required this.iconBackgroundSize,
    required this.linearGradientBegin,
    required this.linearGradientEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //Settings Container
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [this.colorGradient1, this.colorGradient2],
          begin: this.linearGradientBegin,
          end: this.linearGradientEnd,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            spreadRadius: -10,
            offset: Offset(8, 7),
          ),
        ],
      ),
      //Child
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned(
              bottom: -33,
              right: -12,
              child: FaIcon(
                this.icon,
                size: this.iconBackgroundSize,
                color: this.iconBackgroundColorOpacity.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
