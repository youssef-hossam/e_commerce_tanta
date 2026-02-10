import 'package:e_commerce_tanta/features/products/products_view.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  List<Widget> pages = [
    ProductsView(),
    Column(),
    Column(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              currentIndex: currentIndex,
              onTap: (value) => setState(() => currentIndex = value),
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/Home.png',
                      color: Colors.grey,
                    ),
                    label: "Home",
                    activeIcon: Image.asset(
                      'assets/images/Home.png',
                      color: Colors.blue,
                    )),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/Cart.png'),
                    label: "Cart",
                    activeIcon: Image.asset(
                      'assets/images/Cart.png',
                      color: Colors.blue,
                    )),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/User.png'),
                    label: "person",
                    activeIcon: Image.asset(
                      'assets/images/User.png',
                      color: Colors.blue,
                    )),
              ]),
        ),
        appBar: AppBar(
          title: Text("Products"),
          centerTitle: true,
        ),
        body: pages[currentIndex]);
  }
}
