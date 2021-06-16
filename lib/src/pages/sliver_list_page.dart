import 'package:disenios_app/src/theme/themechanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//======WIDGET PRINCIPAL======
class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: 0,
            right: 0,
            child: _ButtonNewList(),
          ),
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

class _ButtonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width * 0.9;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'CREATE NEW LIST',
        style: TextStyle(
          color: (appTheme.darkTheme) ? (Colors.black) : (Colors.white),
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(sWidth, 50)),
          backgroundColor: (appTheme.darkTheme)
              ? MaterialStateProperty.all(appTheme.currentTheme.accentColor)
              : MaterialStateProperty.all(Color(0xffED6762)),
          elevation: MaterialStateProperty.all(20),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))))),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 185,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.currentTheme.scaffoldBackgroundColor,
              child: _Titulo(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ...items,
              SizedBox(height: 80),
            ],
          ),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

//======TITULO======
class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text("New",
                  style: TextStyle(
                      color:
                          appTheme.darkTheme ? Colors.grey : Color(0xff532128),
                      fontSize: 50))),
          //
          Stack(
            children: [
              //Linea
              SizedBox(width: 100),
              Positioned(
                bottom: 8,
                child: Container(
                    width: 100,
                    height: 7,
                    color:
                        appTheme.darkTheme ? Colors.grey : Color(0xffF7CDD5)),
              ),
              Container(
                child: Text("List",
                    style: TextStyle(
                        color: Color(0xffD93A30),
                        fontSize: 50,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//======_LISTA DE TAREAS======
// ignore: unused_element
class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
    );
  }
}

//======_lISTA DE ITEMS======
class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(20),
      height: 90,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: appTheme.darkTheme ? Colors.grey : color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
