import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/models/adver.model.dart';
import 'package:shopify_app/widgets/carousel_slider_ex.widget.dart';
import 'package:shopify_app/widgets/headline.widget.dart';
import 'package:shopify_app/widgets/home/categories_row.home.widget.dart';
import '../models/product.model.dart';
import '../widgets/carouselwidget.dart';
import '../widgets/prodouct_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
            child: Column(children: [
          HeadlineWidget(title: 'Categories'),
          CategoriesRowHome(),
          Consumer<List<Advertisement>?>(
            builder: (context, advertisements, child) {
              if (advertisements == null) {
                return CircularProgressIndicator();
              } else if (advertisements.isEmpty) {
                return Text('No Data Found');
              } else {
                return CarouselSliderWithIndicator(
                  items: advertisements
                      .map((e) => CarouselWidget(
                            adverItem: e,
                          ))
                      .toList(),
                );
              }
            },
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Consumer<List<Product>?>(
              builder: (ctx, productValues, _) {
                if (productValues == null) {
                  return CircularProgressIndicator();
                } else if (productValues.isEmpty) {
                  return Text('No Data Found');
                } else {
                  return Row(children: [
                    ...productValues.map((prod) => ProductWidget(product: prod))
                  ]);
                }
              },
            ),
          )
        ])));
  }
}