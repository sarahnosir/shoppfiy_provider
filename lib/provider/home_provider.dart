import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopify_app/models/category.model.dart';

import '../models/adver.model.dart';
import '../utils/collection.dart';

class HomeProvider extends ChangeNotifier {
  List<Ads>? adList;
  List<CategoryData>? categorieList;

  void initHomeProvider() async {
    await getAds();
    await getCategories();
  }

  Future<void> getAds() async {
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection(CollectionsUtils.ads.name)
        .get();
    adList =
        List<Ads>.from(result.docs.map((e) => Ads.fromJson(e.data(), e.id)));
    notifyListeners();
  }

  Future<void> getCategories() async {
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection(CollectionsUtils.categories.name)
        .get();
    categorieList = List<CategoryData>.from(
        result.docs.map((e) => CategoryData.fromJson(e.data(), e.id)));
    notifyListeners();
  }
}
