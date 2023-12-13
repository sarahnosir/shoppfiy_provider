import 'package:flutter/material.dart';
import 'package:shopify_app/models/adver.model.dart';

import 'custom_button.dart';

class CarouselWidget extends StatelessWidget {
  final Advertisement adverItem;
  const CarouselWidget({
    super.key,
    required this.adverItem,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = ElevatedButton.styleFrom(
        minimumSize: Size(40, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.black)
        ),
        child: Stack(
          children: [
            Image.asset(
              adverItem.imgpath ?? 'assets/images/img1.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
                left: 20,
                top: 40,
                child: Text(
                  adverItem.title ?? 'No title',
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  // maxLines: 3,
                  // textDirection: TextDirection.rtl,
                  //  textAlign: TextAlign.justify,  overflow: TextOverflow.clip,
                )),
            Positioned(
              left: 20,
              bottom: 20,
              child: CustomButton(
                text: "SEE MORE",
                onBtnPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
