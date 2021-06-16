import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenios_app/src/theme/themechanger.dart';
import 'package:disenios_app/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: HeaderWave(color: appTheme.accentColor),
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
