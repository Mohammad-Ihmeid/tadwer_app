// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CompanyType extends Equatable {
  final int compId;
  final String name;
  final String uIdRef;

  const CompanyType({
    required this.compId,
    required this.name,
    required this.uIdRef,
  });

  @override
  List<Object> get props => [compId, name, uIdRef];
}
