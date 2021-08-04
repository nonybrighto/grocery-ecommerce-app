import 'package:flutter/material.dart';
import 'package:grocery_freebie/constants/constants.dart';
import 'package:grocery_freebie/models/category.dart';
import 'package:grocery_freebie/models/product.dart';
import 'package:grocery_freebie/widgets/category_item.dart';
import 'package:grocery_freebie/widgets/product_control_item.dart';
import 'package:grocery_freebie/widgets/product_grid_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      height: 15,
    );
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              spacer,
              _buildCategories(),
              spacer,
              _buildNewArrivals(),
              spacer,
              _buildDailyNeeds(),
            ],
          ),
        ),
      ),
    );
  }

  _buildCategories() {
    List<Category> categories = [
      Category(
          name: 'vegetables',
          imageUrl: 'broccoli',
          color: const Color(0xff88c057).withOpacity(0.20)),
      Category(
          name: 'Fruits',
          imageUrl: 'fruit',
          color: const Color(0xffFCD770).withOpacity(0.20)),
      Category(
          name: 'Masala',
          imageUrl: 'mortar',
          color: const Color(0xff713708).withOpacity(0.10)),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map((category) => CategoryItem(
                  category: category,
                ))
            .toList(),
      ),
    );
  }

  _buildSearchBar() {
    return Row(
      children: [
        Image.asset('assets/icons/delivery.png'),
        const SizedBox(
          width: kDefaultPadding,
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 30,
                    offset: const Offset(0, 5)),
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 4),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Product',
                  hintStyle: TextStyle(
                    color: const Color(0xff434040).withOpacity(0.30),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: const Color(0xff707070).withOpacity(0.30),
                  )),
            ),
          ),
        )),
      ],
    );
  }

  _buildNewArrivals() {
    List<Product> products = [
      Product(
        name: 'Deshi Mango',
        imageUrl: 'mango',
        price: 300,
        quantity: '1Kg',
        shade: Shade.orange,
      ),
      Product(
        name: 'Brocolli',
        imageUrl: 'broccoli',
        price: 450,
        quantity: '5 in pack',
        inCart: true,
      ),
    ];
    return _buildProductWrapper(
        title: 'NEW ARRIVALS',
        color: const Color(0xfffc5455),
        child: GridView.builder(
          clipBehavior: Clip.none,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25.0,
              childAspectRatio: 3 / 4),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ProductGridItem(product: products[index]),
            );
          },
        ));
  }

  _buildDailyNeeds() {
    List<Product> products = [
      Product(
        name: 'Cabbage',
        imageUrl: 'cabbage',
        price: 300,
        quantity: '1Kg',
      ),
      Product(
        name: 'Red/yellow capsicum',
        imageUrl: 'capscium',
        price: 450,
        quantity: '5 in pack',
        inCart: true,
      ),
    ];
    return _buildProductWrapper(
        title: 'DAILY NEEDS',
        color: const Color(0xff03506C),
        child: Column(
          children: [
            for (Product product in products)
              ProductControlItem(product: product)
          ],
        ));
  }

  _buildProductWrapper(
      {required String title, required Color color, required Widget child}) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              color: color,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              )),
          InkWell(
            child: Text(
              'SEE ALL',
              style: TextStyle(
                color: color,
              ),
            ),
            onTap: () {},
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        child,
      ],
    );
  }
}
