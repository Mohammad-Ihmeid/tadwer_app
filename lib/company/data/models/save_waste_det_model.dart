import 'package:tadwer_app/company/domain/entities/save_waste_det.dart';

class SaveWasteDetModel extends SaveWasteDet {
  const SaveWasteDetModel({
    required super.basId,
    required super.userRef,
    required super.wastRef,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['basId'] = basId;
    json['userRef'] = userRef;
    json['wastRef'] = wastRef;
    return json;
  }
}
