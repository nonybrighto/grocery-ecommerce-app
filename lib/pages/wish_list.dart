import 'package:flutter/material.dart';
import 'package:grocery_freebie/models/cart_item.dart';
import 'package:grocery_freebie/models/product.dart';
import 'package:grocery_freebie/widgets/app_button.dart';
import 'package:grocery_freebie/widgets/base_view.dart';
import 'package:grocery_freebie/widgets/cart_product_item.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartItem> wishList = [
      CartItem(
        product: Product(
          name: 'Pineapple',
          imageUrl: 'pineapple',
          price: 50,
          quantity: '4 in 1 pack',
          description: 'Pineapple',
        ),
        count: 1,
      ),
      CartItem(
        product: Product(
          name: 'Deshi Cabbage',
          imageUrl: 'cabbage',
          price: 90,
          quantity: '1kg',
          description: 'Pineapple',
        ),
        count: 4,
      ),
    ];
    return BaseView(
        title: 'Your Wishlist',
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  for (CartItem wish in wishList)
                    CartProductItem(cartItem: wish)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: AppButton(title: 'Add to Cart'),
              ),
            )
          ],
        ));
  }
}
