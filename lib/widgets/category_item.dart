import 'package:flutter/material.dart';
import 'package:grocery_freebie/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 80;
    const containerRadius = BorderRadius.all(Radius.circular(10));
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: containerRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: containerRadius,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/${category.imageUrl}.png'),
              const SizedBox(
                height: 6,
              ),
              Text(
                category.name,
                style: const TextStyle(fontSize: 11),
              )
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
