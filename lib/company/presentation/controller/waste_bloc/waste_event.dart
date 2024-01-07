part of 'waste_bloc.dart';

sealed class WasteEvent extends Equatable {
  const WasteEvent();
}

class GetWasteByCategoryEvent extends WasteEvent {
  final int catId;

  const GetWasteByCategoryEvent(this.catId);

  @override
  List<Object?> get props => [catId];
}

class ShowWasteDetEvent extends WasteEvent {
  final int wasteID;
  final bool showWasteDet;

  const ShowWasteDetEvent({required this.wasteID, required this.showWasteDet});

  @override
  List<Object?> get props => [wasteID, showWasteDet];
}

class AddWasteToBasketEvent extends WasteEvent {
  final int wasteID;

  const AddWasteToBasketEvent({required this.wasteID});

  @override
  List<Object?> get props => [wasteID];
}

class UpdateQuantityOrAdd extends WasteEvent {
  final int wasteID;

  const UpdateQuantityOrAdd({required this.wasteID});

  @override
  List<Object?> get props => [wasteID];
}
