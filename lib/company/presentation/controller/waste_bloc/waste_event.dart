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
