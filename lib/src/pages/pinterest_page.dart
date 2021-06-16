import 'package:disenios_app/src/theme/themechanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:disenios_app/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) {
        return _MenuModel();
      },
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
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
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrarMenu;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (widthPantalla > 500) {
      widthPantalla = widthPantalla - 300;
    }

    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Row(
          children: [
            //Spacer crea un espacio en el Row
            Spacer(),
            PinterestMenu(
              mostrarMenu: mostrar,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.accentColor,
              inactiveColor: Colors.purple.shade100,
              itemsMenuList: [
                PinterestButton(
                    onPressed: () {
                      print("Icon pie_chart");
                    },
                    icon: Icons.pie_chart),
                PinterestButton(
                    onPressed: () {
                      print("Icon search");
                    },
                    icon: Icons.search),
                PinterestButton(
                    onPressed: () {
                      print("Icon notifications");
                    },
                    icon: Icons.notifications),
                PinterestButton(
                    onPressed: () {
                      print("Icon supervised_user_circle");
                    },
                    icon: Icons.supervised_user_circle),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);

  ScrollController scrollController = ScrollController();
  double previousScroll = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > previousScroll) {
        Provider.of<_MenuModel>(context, listen: false).mostrarMenu = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrarMenu = true;
      }

      previousScroll = scrollController.offset; //actualiza el previousScroll
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.purple[500],
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.yellow.shade200,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

//=====MODEL Provider

class _MenuModel with ChangeNotifier {
  bool _mostrarMenu = true;

  bool get mostrarMenu => this._mostrarMenu;

  set mostrarMenu(bool valor) {
    this._mostrarMenu = valor;
    notifyListeners();
  }
}
