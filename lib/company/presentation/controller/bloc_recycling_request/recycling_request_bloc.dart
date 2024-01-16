import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/company/domain/entities/add_address.dart';
import 'package:tadwer_app/company/domain/usecases/add_address_usecase.dart';

part 'recycling_request_event.dart';
part 'recycling_request_state.dart';

class RecyclingRequestBloc
    extends Bloc<RecyclingRequestEvent, RecyclingRequestState> {
  final AddUserAddressUseCase addAddressUseCase;
  RecyclingRequestBloc(this.addAddressUseCase)
      : super(const RecyclingRequestState()) {
    on<AddAdressEvent>(_addAdressEvent);
  }

  FutureOr<void> _addAdressEvent(AddAdressEvent event, emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userRef = prefs.getInt("Uid") ?? 0;

    final result = await addAddressUseCase(AddUserAddressParameters(
      AddAddress(
        userRef: userRef,
        city: event.city,
        area: event.area,
        street: event.street,
        phone: event.phone,
        buildNum: event.buildNum,
        additional: event.additional,
      ),
    ));

    result.fold((l) {}, (r) {});
  }
}
