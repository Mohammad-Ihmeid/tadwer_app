// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int catId;
  final String name;
  final String catImg;

  const Category(
      {required this.catId, required this.name, required this.catImg});

  @override
  List<Object> get props => [catId, name, catImg];
}
