import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0; //init

//GET
  double get currentPage {
    return this._currentPage;
  }

  //SET
  set currentPage(double pagina) {
    this._currentPage = pagina;
    print(pagina);
    notifyListeners();
  }
}
