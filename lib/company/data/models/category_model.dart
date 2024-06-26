import 'package:tadwer_app/company/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.catId,
    required super.name,
    required super.catImg,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        catId: json["catId"],
        name: json["name"],
        catImg: json["catImg"] ?? '',
      );
}
