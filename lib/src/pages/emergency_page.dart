import 'package:flutter/material.dart';

import 'package:disenios_app/src/widgets/button_fat_option.dart';
import 'package:disenios_app/src/widgets/headers_emergency.dart';

//Font Awesome
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//Animate_do
import 'package:animate_do/animate_do.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size Screen
    final screenSize = MediaQuery.of(context).size;

    bool isLarge;
    if (screenSize.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map(
          (item) => ElasticIn(
            child: ButtonFatOption(
              icon: item.icon,
              title: item.texto,
              colorGradient1: item.color1,
              colorGradient2: item.color2,
              onPress: () => print("Click"),
            ),
          ),
        )
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: isLarge ? 210 : 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                //Si es Large aparece el SizedBox, caso contrario no.
                if (isLarge) SizedBox(height: 90),
                ...itemMap,
              ],
            ),
          ),
          //Si es Large aparece el encabezado, caso contrario no.
          if (isLarge) _Encabezado(),
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
              : SizedBox()),
    );
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          title: "Haz solicitado",
          subtitle: "Asistencia Médica",
          icon: FontAwesomeIcons.plus,
          colorGradient1: Color(0xff67ACF2),
          colorGradient2: Color(0xff526BF6),
        ),
        Positioned(
          right: 0,
          top: 12,
          child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(15),
              child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white)),
        ),
      ],
    );
  }
}
