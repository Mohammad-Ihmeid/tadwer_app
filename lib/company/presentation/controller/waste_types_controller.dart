import 'package:flutter/material.dart';
import 'package:tadwer_app/company/data/models/waste_type_model.dart';
import 'package:tadwer_app/company/domain/usecases/waste_type_data.dart';

class WasteTypeProvider with ChangeNotifier {
  List<WasteTypeModel> listWasteType = [];

  WasteTypeProvider() {
    initializeProvider();
  }

  initializeProvider() {
    listWasteType = WasteTypeData.listWasteType;
    notifyListeners();
  }

  onChanged({required bool select, required WasteTypeModel item}) {
    item.isSelected = select;
    notifyListeners();
  }
}
