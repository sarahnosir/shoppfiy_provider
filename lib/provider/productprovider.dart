import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/product.model.dart';

class ProductProvider {
  static Map _data = {};

  List<Product> products = [];
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    var response = await rootBundle.loadString('assets/data/data.json');
    _data = jsonDecode(response);
    return products =
        (_data['products'] as List).map((e) => Product.fromJson(e)).toList();
  }
}
