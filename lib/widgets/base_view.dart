import 'package:flutter/material.dart';
import 'package:grocery_freebie/constants/constants.dart';

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;
  final bool useDefaultPadding;
  const BaseView(
      {Key? key,
      required this.title,
      required this.body,
      this.useDefaultPadding = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(300),
          child: Container(
            height: AppBar().preferredSize.height,
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xffd8d8d8)))),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: useDefaultPadding ? kDefaultPadding : 0),
            child: body),
      ),
    );
  }
}
