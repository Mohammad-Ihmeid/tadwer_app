import 'package:tadwer_app/company/data/models/waste_type_model.dart';

class WasteTypeData {
  static List<WasteTypeModel> listWasteType = [
    WasteTypeModel(isSelected: false, wasteType: "مخلفات عضوية"),
    WasteTypeModel(isSelected: false, wasteType: "مخلفات بلاستيكية"),
    WasteTypeModel(isSelected: false, wasteType: "مخلفات كرتونية"),
    WasteTypeModel(isSelected: false, wasteType: "مخلفات معدنية"),
    WasteTypeModel(isSelected: false, wasteType: "أخرى"),
  ];
}
