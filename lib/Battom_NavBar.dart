import 'package:flutter/material.dart';
import 'package:restaurantapp/Account_Page/Profile/ProfileBuilder.dart';
import 'package:restaurantapp/Cart_Page/Cart_Page.dart';
import 'package:restaurantapp/Favoriate_Page/Favoriate_Page.dart';
import 'package:restaurantapp/HomePage/HomePage.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() =>
      _BottomNavBarState();
}

class _BottomNavBarState
    extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final List _widgetOptions = [
    HomePage(),
     Cart_Page( ),
    const Favoriate_Page(),
    ProfileBuilder()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            backgroundColor: Colors.white,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
                    backgroundColor: Colors.white,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
                    backgroundColor: Colors.white,

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor:Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
