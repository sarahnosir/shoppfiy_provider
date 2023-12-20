import 'package:flutter/material.dart';
import 'package:shopify_app/models/product.model.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: () {},
      child: SizedBox(
          width: 150,
          height: 170,
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset(
                      product.image ?? 'assets/images/pngwing.com (2).png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(product.name ?? "name"),
                      const SizedBox(height: 8.0),
                      Text(product.price.toString()),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
