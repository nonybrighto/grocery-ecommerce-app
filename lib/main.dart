import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_freebie/constants/constants.dart';
import 'package:grocery_freebie/pages/cart.dart';
import 'package:grocery_freebie/pages/home.dart';
import 'package:grocery_freebie/pages/user_profile.dart';
import 'package:grocery_freebie/pages/wish_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Freebie',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: const Color(0xffffffff)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        body: _buildPageContent(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: kBarIconColor,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _createBarIcon('home', 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _createBarIcon('cart', 1),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: _createBarIcon('wish_list', 2),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: _createBarIcon('user_profile', 3),
              label: 'You',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent() {
    switch (_currentIndex) {
      case 0:
        return const Home();
      case 1:
        return const Cart();
      case 2:
        return const WishList();
      case 3:
        return const UserProfile();
      default:
        return const Home();
    }
  }

  Widget _createBarIcon(String name, int index) {
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      color: _currentIndex == index
          ? Theme.of(context).primaryColor
          : kBarIconColor,
    );
  }
}
