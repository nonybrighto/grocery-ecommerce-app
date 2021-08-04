import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_freebie/constants/constants.dart';
import 'package:grocery_freebie/models/product.dart';
import 'package:grocery_freebie/pages/product_display.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  const ProductGridItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      height: 3,
    );
    double imageSize = MediaQuery.of(context).size.width / 3.5;
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 30,
                offset: const Offset(0, 5)),
          ]),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/images/${product.imageUrl}.png',
                      width: imageSize,
                      height: imageSize,
                    )),
                    Text(
                      product.getFormattedPrice(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: kTextColor.withOpacity(0.68)),
                    ),
                    spacer,
                    Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    spacer,
                    Text(
                      product.quantity,
                      style: TextStyle(
                          fontSize: 13, color: kTextColor.withOpacity(0.30)),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDisplayPage(
                            product: product,
                          )));
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/wish_list.svg',
                  color: const Color(0xFFC0C0C0),
                )),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: product.inCart
                ? _buildCartUpdateButton()
                : _buildAddCartButton(),
          )
        ],
      ),
    );
  }

  Widget _buildAddCartButton() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: product.shade == Shade.green
                  ? [kGreenFirstColor, kGreenSecondColor]
                  : [kOrangeFirstColor, kOrangeSecondColor])),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: const Center(
            child: Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildCartUpdateButton() {
    return Container(
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: product.shade == Shade.green
                    ? [kGreenFirstColor, kGreenSecondColor]
                    : [kOrangeFirstColor, kOrangeSecondColor])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.remove_circle,
                color: Colors.white,
              ),
              Text(
                '02',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.add_circle,
                color: Colors.white,
              )
            ],
          ),
        ));
  }
}
