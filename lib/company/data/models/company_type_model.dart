import 'package:tadwer_app/company/domain/entities/company_type.dart';

class CompanyTypeModel extends CompanyType {
  const CompanyTypeModel({
    required super.compId,
    required super.name,
    required super.uIdRef,
  });

  factory CompanyTypeModel.fromJson(Map<String, dynamic> json) =>
      CompanyTypeModel(
        compId: json["compId"],
        name: json["name"],
        uIdRef: json["uIdRef"].toString(),
      );
}
