import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:disenios_app/src/widgets/slideshow.dart';
import 'package:disenios_app/src/theme/themechanger.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: screenSize.height > 500
          ? Column(
              children: [
                Expanded(child: MySlideShow()),
                Expanded(child: MySlideShow()),
              ],
            )
          : Row(
              children: [
                Expanded(child: MySlideShow()),
                Expanded(child: MySlideShow()),
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

class MySlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return SlideShow(
      bulletPrimario: 18,
      bulletSecundario: 13,
      colorPrimario: appTheme.darkTheme
          ? appTheme.currentTheme.accentColor
          : appTheme.currentTheme.accentColor,
      colorSecundario: Colors.black54,
      circle: false,
      upDot: false,
      slides: [
        SvgPicture.asset('assets/svg/1.svg'),
        SvgPicture.asset('assets/svg/2.svg'),
        SvgPicture.asset('assets/svg/3.svg'),
        SvgPicture.asset('assets/svg/4.svg'),
        SvgPicture.asset('assets/svg/5.svg'),
      ],
    );
  }
}
