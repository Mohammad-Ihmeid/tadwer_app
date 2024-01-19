import 'package:tadwer_app/company/domain/entities/waste_entities/waste.dart';

class WasteModel extends Waste {
  WasteModel(
      {required super.westRef, required super.wasteName, super.showWest});

  factory WasteModel.fromJson(Map<String, dynamic> json) => WasteModel(
        westRef: json["id"],
        wasteName: json["wasteName"],
      );
}
