import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/users/data/models/home_model.dart';

class HomeData {
  static List<HomeModel> listData = [
    HomeModel(name: "مؤسسات تعليمية", image: IconsAssets.openBook),
    HomeModel(name: "منشئات تجارية", image: IconsAssets.officeBuilding),
    HomeModel(name: "مطاعم", image: IconsAssets.waiter),
    HomeModel(name: "فنادق", image: IconsAssets.luggageCart),
    HomeModel(name: "مصانع", image: IconsAssets.factory),
    HomeModel(name: "سوبر ماركت", image: IconsAssets.shoppingCart),
    HomeModel(name: "افراد", image: IconsAssets.multipleUsers),
  ];
}
