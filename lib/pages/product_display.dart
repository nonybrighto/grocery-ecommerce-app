import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_freebie/constants/constants.dart';
import 'package:grocery_freebie/models/product.dart';
import 'package:grocery_freebie/widgets/app_button.dart';
import 'package:grocery_freebie/widgets/product_control_item.dart';

class ProductDisplayPage extends StatelessWidget {
  final Product product;
  const ProductDisplayPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      height: 6,
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(context),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  transform: Matrix4.translationValues(0, -45, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductTopInfo(context, spacer),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 4, vertical: 20),
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                          'Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s',
                          style: TextStyle(
                              height: 1.5,
                              color: const Color(0xff1d1d1d).withOpacity(0.50)),
                        ),
                      ),
                      spacer,
                      const Text(
                        'Related Items',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      spacer,
                      _buildRelatedItems()
                    ],
                  ),
                )
              ],
            ),
          )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AppButton(
                  isGreen: product.shade == Shade.green,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )))
        ],
      ),
    );
  }

  Container _buildProductTopInfo(BuildContext context, SizedBox spacer) {
    double imageSize = MediaQuery.of(context).size.width / 2;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 30,
                offset: const Offset(0, 5)),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/wish_list.svg',
                  width: 40,
                  color: const Color(0xFFC0C0C0),
                )),
          ),
          spacer,
          Center(
            child: Image.asset(
              'assets/images/${product.imageUrl}.png',
              fit: BoxFit.cover,
              width: imageSize,
              height: imageSize,
            ),
          ),
          Text(
            product.getFormattedPrice(),
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: kTextColor.withOpacity(0.68)),
          ),
          spacer,
          Text(
            product.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          spacer,
          Text(
            product.quantity,
            style: TextStyle(fontSize: 19, color: kTextColor.withOpacity(0.30)),
          ),
        ],
      ),
    );
  }

  Stack _buildHeader(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            color: product.shade == Shade.green
                ? kGreenFirstColor
                : kOrangeFirstColor,
            height: 150,
          ),
        ),
        Positioned(top: -40, left: -60, child: _headerCirlce(false)),
        Positioned(top: -80, right: -35, child: _headerCirlce(true)),
        AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.dark,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset('assets/icons/back_button.svg')),
          title: const Text(
            'Details',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _buildRelatedItems() {
    List<Product> products = product.shade == Shade.green
        ? [
            Product(
              name: 'Brocolli',
              imageUrl: 'broccoli',
              price: 300,
              quantity: '1Kg',
            ),
            Product(
              name: 'Deshi Cabbage',
              imageUrl: 'cabbage',
              price: 450,
              quantity: '5 in pack',
              inCart: true,
            ),
          ]
        : [
            Product(
              name: 'Pineapple',
              imageUrl: 'pineapple',
              price: 300,
              quantity: '1Kg',
              shade: Shade.orange,
            ),
            Product(
              name: 'Mango',
              imageUrl: 'mango',
              price: 450,
              quantity: '5 in pack',
              inCart: true,
              shade: Shade.orange,
            ),
          ];
    return Column(
      children: [
        for (Product product in products) ProductControlItem(product: product)
      ],
    );
  }

  Widget _headerCirlce(bool isBig) {
    double size = isBig ? 210 : 160;
    return Container(
      decoration: BoxDecoration(
          color: product.shade == Shade.green
              ? kGreenSecondColor.withOpacity(0.40)
              : kOrangeSecondColor.withOpacity(0.40),
          // color: Colors.red.withOpacity(0.5),
          borderRadius: BorderRadius.circular(size)),
      width: size,
      height: size,
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  // const HeaderClipper();

  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 75, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
