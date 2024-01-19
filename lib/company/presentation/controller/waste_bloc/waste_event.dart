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
  final int westRef;

  const ShowWasteDetEvent(this.westRef);

  @override
  List<Object?> get props => [westRef];
}

class AddWasteToBasketEvent extends WasteEvent {
  final int wasteID;
  final String count;
  const AddWasteToBasketEvent({required this.wasteID, required this.count});

  @override
  List<Object?> get props => [wasteID, count];
}

class UpdateQuantityOrAdd extends WasteEvent {
  final int wasteID;

  const UpdateQuantityOrAdd({required this.wasteID});

  @override
  List<Object?> get props => [wasteID];
}
