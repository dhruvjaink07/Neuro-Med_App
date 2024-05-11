import 'package:flutter/material.dart';

class SelectedBrandsModel extends ChangeNotifier {
  Set<String> selectedBrands = {};

  void addBrand(String brand) {
    selectedBrands.add(brand);
    notifyListeners();
  }

  void removeBrand(String brand) {
    selectedBrands.remove(brand);
    notifyListeners();
  }

  bool containsBrand(String brand) {
    return selectedBrands.contains(brand);
  }
}
