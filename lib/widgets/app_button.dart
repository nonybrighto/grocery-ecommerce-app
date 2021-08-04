import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_freebie/constants/constants.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final bool isGreen;
  const AppButton({Key? key, this.title, this.child, this.isGreen = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5,
                offset: const Offset(0, 4)),
          ],
          gradient: LinearGradient(
            colors: isGreen
                ? [kGreenFirstColor, kGreenSecondColor]
                : [kOrangeFirstColor, kOrangeSecondColor],
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
            child: Center(
              child: child ??
                  Text(
                    title ?? 'title',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
