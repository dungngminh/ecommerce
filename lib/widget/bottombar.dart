import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/screens/feeds.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/search.dart';
import 'package:ecommerce/screens/user.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 3;
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': 'Home'},
      {'page': FeedsScreen(), 'title': 'Feed'},
      {'page': SearchScreen(), 'title': 'Search'},
      {'page': CartScreen(), 'title': 'Cart'},
      {'page': UserScreen(), 'title': 'User'},
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex]['page'] as Widget,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 3,
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: CircularNotchedRectangle(),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectedPage,
              currentIndex: _selectedIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(kHome),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(kFeed),
                  label: 'Feeds',
                ),
                BottomNavigationBarItem(
                  icon: Icon(null),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(kCart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(kUser),
                  label: 'User',
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          tooltip: 'Search',
          elevation: 5,
          onPressed: () {},
          child: Icon(
            kSearch,
            color: Colors.white,
          ),
        ));
  }
}
