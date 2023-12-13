import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shopify_app/models/adver.model.dart';

class AdvertisementProvider {
  static Map _data = {};
  static List<Advertisement> advertisements = [];
  Future<List<Advertisement>> getAdvertisment() async {
    await Future.delayed(const Duration(seconds: 3));
    var response = await rootBundle.loadString('assets/data/data.json');
    _data = jsonDecode(response);
    return advertisements = (_data['advertisements'] as List)
        .map((e) => Advertisement.fromJson(e))
        .toList();
  }
}
