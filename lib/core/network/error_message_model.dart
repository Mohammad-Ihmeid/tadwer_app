// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String errorMessage;
  final String stackTrace;

  const ErrorMessageModel(
      {required this.statusCode,
      required this.errorMessage,
      required this.stackTrace});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusCode: json["statusCode"],
        errorMessage: json["errorMessage"],
        stackTrace: json["stackTrace"],
      );

  @override
  List<Object?> get props => [statusCode, errorMessage, stackTrace];
}
