import 'package:flutter/material.dart';

import 'package:disenios_app/src/pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier {
  //Page por defecto
  Widget _currentPage = SlideShowPage();

  Widget get currentPage => this._currentPage;

  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }
}
