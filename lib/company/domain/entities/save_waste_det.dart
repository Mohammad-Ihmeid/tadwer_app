// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/data/models/save_waste_det_model.dart';

class SaveWasteDet extends Equatable {
  final int basId;
  final int userRef;
  final int wastRef;

  const SaveWasteDet({
    required this.basId,
    required this.userRef,
    required this.wastRef,
  });

  SaveWasteDetModel toModel() {
    return SaveWasteDetModel(
      basId: basId,
      userRef: userRef,
      wastRef: wastRef,
    );
  }

  @override
  List<Object> get props => [basId, userRef, wastRef];
}
