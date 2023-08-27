import 'package:flutter/material.dart';
import 'package:shopping_app/cartPage.dart';
import 'package:shopping_app/productpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentpage = 0;
  List<Widget> pages = const [ProductPage(), Cartpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentpage,
          children: pages,
        ),
        //  currentpage == 0 ? const ProductPage() : const Cartpage(),
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 35,
            onTap: (value) => setState(() {
                  currentpage = value;
                }),
            currentIndex: currentpage,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Cart',
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ]));
  }
}
