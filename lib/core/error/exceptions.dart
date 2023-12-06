import 'package:tadwer_app/core/network/error_message_model.dart';

class RemoteExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  const RemoteExceptions({
    required this.errorMessageModel,
  });
}

class DataBaseException implements Exception {
  final String message;

  DataBaseException({
    required this.message,
  });
}
