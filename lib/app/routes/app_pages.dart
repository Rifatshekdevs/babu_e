import 'package:get/get.dart';

import '../../src/model/subcategory.dart';
import '../modules/banjonborno/bindings/banjonborno_binding.dart';
import '../modules/banjonborno/views/banjonborno_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/gridplayground/bindings/grid_binding.dart';
import '../modules/gridplayground/views/grid_view.dart';
import '../modules/number/bindings/number_binding.dart';
import '../modules/number/views/number_view.dart';
import '../modules/sorborno/bindings/sorborno_binding.dart';
import '../modules/sorborno/views/sorborno_view.dart';
import '../modules/subcategory/bindings/subcategory_binding.dart';
import '../modules/subcategory/views/subcategory_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CATEGORY;

  static final routes = [
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.SUBCATEGORY,
      page: () => SubcategoryView(),
      binding: SubcategoryBinding(),
    ),
    GetPage(
      name: _Paths.BANJONBORNO,
      page: () => BanjonbornoView(
        id: 'Unknown',
        subcategoryModel: SubcategoryModel(),
      ),
      binding: BanjonbornoBinding(),
    ),
    GetPage(
      name: _Paths.SORBORNO,
      page: () => SorbornoView(
        id: 'Unknown',
        subcategoryModel: SubcategoryModel(),
      ),
      binding: SorbornoBinding(),
    ),
    GetPage(
      name: _Paths.NUMBER,
      page: () => NumberView(
        id: 'Unknown',
        subcategoryModel: SubcategoryModel(),
      ),
      binding: NumberBinding(),
    ),
    GetPage(
      name: _Paths.GRID,
      page: () =>  GridPlaygroundView(id: 'Unknown', subcategoryModel: SubcategoryModel(),),
      binding: GridPlaygroundBinding(),
    ),
  ];
}
