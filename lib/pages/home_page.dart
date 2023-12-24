import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/provider/home_provider.dart';
import 'package:shopify_app/widgets/home/carousel_slider_ex.widget.dart';
import 'package:shopify_app/widgets/headline.widget.dart';
import 'package:shopify_app/widgets/home/categories_row.home.widget.dart';
import '../provider/category_provider.dart';
import '../provider/product_provider.dart';
import '../widgets/home/carouselwidget.dart';
import '../widgets/home/prodouct_card.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';

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
          Consumer<CategoryProvider>(
            builder: (__, caegoryProvider, _) {
              return FutureBuilder(
                  future: caegoryProvider.getCategories(context, limit: 3),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text('Error While Get Data');
                      } else if (snapshot.hasData) {
                        return CategoriesRowHome(
                          categories: snapshot.data ?? [],
                        );
                      } else {
                        return Text('No Data Found');
                      }
                    } else {
                      return Text(
                          'Connection Statue ${snapshot.connectionState}');
                    }
                  });
            },
          ),
          Consumer<HomeProvider>(
            builder: (context, advertisements, child) {
              if (advertisements == null) {
                return CircularProgressIndicator();
              } else if (advertisements.adList == null) {
                return Text('No Data Found');
              } else {
                return CarouselSliderWithIndicator(
                  items: advertisements.adList!
                      .map((e) => CarouselWidget(
                            adverItem: e,
                          ))
                      .toList(),
                );
              }
            },
          ),
          Consumer<ProductProvider>(
            builder: (__, productProvider, _) {
              return FutureBuilder(
                  future: productProvider.getProducts(context, limit: 3),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text('Error While Get Data');
                      } else if (snapshot.hasData) {
                        return FlexibleGridView(
                          axisCount: GridLayoutEnum.threeElementsInRow,
                          shrinkWrap: true,
                          children: snapshot.data
                                  ?.map((e) => ProductWidget(product: e))
                                  .toList() ??
                              [],
                        );
                      } else {
                        return Text('No Data Found');
                      }
                    } else {
                      return Text(
                          'Connection Statue ${snapshot.connectionState}');
                    }
                  });
            },
          ),
        ])));
  }
}
