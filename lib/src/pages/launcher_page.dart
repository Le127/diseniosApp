import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Font and Theme
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenios_app/src/theme/themechanger.dart';

//Rutas
import 'package:disenios_app/src/routes/routes.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.currentTheme.accentColor,
          title: Text("Diseños en Flutter - Phone"),
        ),
        drawer: _MenuPrincipal(),
        body: _ListaOpciones());
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.accentColor,
        ),
        title: Text(pageRoutes[index].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => pageRoutes[index].page),
          );
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theme
    final appTheme = Provider.of<ThemeChanger>(context);

    final accentColorTheme = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            //
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 150,
                child: CircleAvatar(
                    backgroundColor: accentColorTheme,
                    child: Text("MF", style: TextStyle(fontSize: 50))),
              ),
            ),
            //
            Expanded(
              child: _ListaOpciones(),
            ),
            //
            ListTile(
              title: Text("Dark Mode"),
              leading: Icon(Icons.lightbulb_outline, color: accentColorTheme),
              trailing: Switch.adaptive(
                activeColor: accentColorTheme,
                value: appTheme.darkTheme,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),
            //
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                title: Text("Custom Theme"),
                trailing: Switch.adaptive(
                  activeColor: accentColorTheme,
                  value: appTheme.customTheme,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  },
                ),
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: accentColorTheme,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
