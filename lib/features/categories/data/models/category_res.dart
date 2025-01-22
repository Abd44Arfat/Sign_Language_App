
class CategoryRes {
  String message;
  List<CategoryModel> categories;

  CategoryRes({
    required this.message,
    required this.categories,
  });

  factory CategoryRes.fromJson(Map<String, dynamic> json) {
    var categoriesFromJson = json['Categorys'] as List;
    List<CategoryModel> categoryList =
        categoriesFromJson.map((i) => CategoryModel.fromJson(i)).toList();

    return CategoryRes(
      message: json['message'],
      categories: categoryList,
    );
  }
}

class CategoryModel {
  String id;
  String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
    );
  }

  String getCategoryId() {
    return id;
  }
}
