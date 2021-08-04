import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_freebie/constants/constants.dart';
import 'package:grocery_freebie/models/product.dart';
import 'package:grocery_freebie/pages/product_display.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Widget extra;
  const ProductItem({
    Key? key,
    required this.product,
    required this.extra,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      height: 10,
    );
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 30,
                offset: const Offset(0, 5)),
          ]),
      child: Material(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Image.asset(
                        'assets/images/${product.imageUrl}.png',
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.getFormattedPrice(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: kTextColor.withOpacity(0.68)),
                            ),
                            spacer,
                            Text(
                              product.name,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            spacer,
                            Text(
                              product.quantity,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: kTextColor.withOpacity(0.30)),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
                  extra
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDisplayPage(
                      product: product,
                    )));
          },
        ),
      ),
    );
  }
}
