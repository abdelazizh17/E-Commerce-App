import 'package:e_commerce/feature/shop/data/models/category_item.dart';
import 'package:e_commerce/feature/shop/data/web_services/category_item_web_services.dart';

class CategoryItemRepo {
  final CategoryItemWebServices categoryItemWebServices;

  CategoryItemRepo(this.categoryItemWebServices);

  Future<List<CategoryItem>> getCategoryItems(String category) async {
    var categoryItems =
        await categoryItemWebServices.getCategoryItems(category);
    return categoryItems
        .map((categoryItem) => CategoryItem.fromJson(categoryItem))
        .toList();
  }
}
