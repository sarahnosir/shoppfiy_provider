import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shopify_app/models/category.model.dart';

class CategoriesProvider {
  static Map _data = {};

  List<CategoryData> categories = [];
  Future<List<CategoryData>> getCategories() async {
    await Future.delayed(const Duration(seconds: 3));
    var response = await rootBundle.loadString('assets/data/data.json');
    _data = jsonDecode(response);
    return categories = (_data['categories'] as List)
        .map((e) => CategoryData.fromJson(e))
        .toList();
  }
}
