import 'package:flutter/cupertino.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/config/network/session_data.dart';
import 'package:getx_base_code/data/remote/category_repository.dart';
import 'package:getx_base_code/domain/models/cateogory_model.dart';

class CategoryUsecase {
  final CategoryRepository _categoryRepository;

  CategoryUsecase(this._categoryRepository);

  Future<List<CategoryModel>> getCategories(
      BuildContext context, int pageNumber, int pageSize) async {
    final categories = <CategoryModel>[];
    final response = await requestApi(
        () => _categoryRepository.getCategories(
            SessionData.authToken, pageNumber, pageSize),
        context);
    if (response.result ?? false) {
      final datas = response.data['data'];
      for (final data in datas) {
        categories.add(
          CategoryModel.fromJson(data),
        );
      }
    }
    return categories;
  }
}
