// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DataBasket extends Equatable {
  final double count;
  final String wasteName;
  final bool isSelect;
  final int basId;
  final int wastId;

  const DataBasket({
    required this.count,
    required this.wasteName,
    required this.isSelect,
    required this.basId,
    required this.wastId,
  });

  @override
  List<Object> get props {
    return [
      count,
      wasteName,
      isSelect,
      basId,
      wastId,
    ];
  }
}
