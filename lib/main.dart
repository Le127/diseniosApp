import 'package:disenios_app/src/models/layout_model.dart';
import 'package:disenios_app/src/pages/launcher_tablet_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//launcher
import 'package:disenios_app/src/pages/launcher_page.dart';

//Theme
import 'package:disenios_app/src/theme/themechanger.dart';

void main() => runApp(
      //Ubicacion Providers
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ThemeChanger(2),
          ),
          ChangeNotifierProvider(
            create: (_) => LayoutModel(),
          ),
        ],
        child: MyApp(),
      ),
    );

/* 
    void main() => runApp(
      //Ubicacion Provider
      ChangeNotifierProvider(
        create: (_) => ThemeChanger(2),
        child: MyApp(),
      ),
    ); */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: appTheme.currentTheme,
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print("orientation $orientation");

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
