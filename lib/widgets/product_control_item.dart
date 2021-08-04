import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_freebie/models/product.dart';
import 'package:grocery_freebie/widgets/circle_button.dart';
import 'package:grocery_freebie/widgets/product_item.dart';

class ProductControlItem extends StatelessWidget {
  final Product product;
  const ProductControlItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductItem(
        product: product,
        extra: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/wish_list.svg',
              color: const Color(0xFFC0C0C0),
            ),
            CircleButton(
              isGreen: product.shade == Shade.green,
            ),
          ],
        ));
  }
}
