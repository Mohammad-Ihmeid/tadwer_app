import 'package:tadwer_app/company/domain/entities/waste_entities/waste.dart';

class WasteModel extends Waste {
  const WasteModel({required super.id, required super.wasteName});

  factory WasteModel.fromJson(Map<String, dynamic> json) => WasteModel(
        id: json["id"],
        wasteName: json["wasteName"],
      );
}
