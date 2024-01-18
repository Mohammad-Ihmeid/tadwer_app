import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/company/domain/entities/address_entities/add_address.dart';
import 'package:tadwer_app/company/domain/entities/address_entities/update_address.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/add_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/check_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/update_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/get_data_basket.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';

part 'recycling_request_event.dart';
part 'recycling_request_state.dart';

class RecyclingRequestBloc
    extends Bloc<RecyclingRequestEvent, RecyclingRequestState> {
  final AddUserAddressUseCase addAddressUseCase;
  final CheckUserAddressUseCase checkAddressUseCase;
  final UpdateAddressUseCase updateAddressUseCase;
  final GetDataBasketUseCase getDataBasketUseCase;
  RecyclingRequestBloc(
    this.addAddressUseCase,
    this.checkAddressUseCase,
    this.updateAddressUseCase,
    this.getDataBasketUseCase,
  ) : super(const RecyclingRequestState()) {
    on<CheckAddressEvent>(_checkAddressEvent);
    on<UpdateAddressEvent>(_updateAddressEvent);
    on<GetDataBasketEvent>((event, emit) async {
      final result = await getDataBasketUseCase(const NoParameters());

      result.fold((l) {}, (r) {
        emit(state.copyWith(dataBasket: r));
      });
    });
  }

  FutureOr<void> _updateAddressEvent(event, emit) async {
    emit(state.copyWith(saveAddressState: SaveState.loading));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userRef = prefs.getInt("Uid") ?? 0;
    if (!state.checkAddress) {
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

      result.fold((l) {
        emit(state.copyWith(
            saveAddressState: SaveState.error, saveAddressError: l.message));
      }, (r) {
        emit(
          state.copyWith(
            saveAddressState: SaveState.success,
          ),
        );
      });
    } else {
      final result =
          await updateAddressUseCase(UpdateAddressParameters(UpdateAddress(
        addressId: state.addressId,
        userRef: userRef,
        city: event.city,
        area: event.area,
        street: event.street,
        phone: event.phone,
        buildNum: event.buildNum,
        additional: event.additional,
      )));

      result.fold((l) {
        emit(state.copyWith(
            saveAddressState: SaveState.error, saveAddressError: l.message));
      }, (r) {
        emit(
          state.copyWith(
            saveAddressState: SaveState.success,
          ),
        );
      });
    }
  }

  FutureOr<void> _checkAddressEvent(event, emit) async {
    emit(state.copyWith(requestAddressState: RequestState.loading));
    final result = await checkAddressUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(requestAddressState: RequestState.error));
    }, (r) {
      emit(
        state.copyWith(
          checkAddress: r.success,
          requestAddressState: RequestState.loaded,
          city: r.city,
          area: r.area,
          street: r.street,
          phone: r.phone,
          buildNum: r.buildNum,
          additional: r.additional,
          addressId: r.addressId,
        ),
      );
    });
  }
}
