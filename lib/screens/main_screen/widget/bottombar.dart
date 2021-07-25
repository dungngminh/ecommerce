import 'package:ecommerce/screens/cart/cart.dart';
import 'package:ecommerce/screens/feeds/feeds.dart';
import 'package:ecommerce/screens/home/home.dart';
import 'package:ecommerce/screens/search/search.dart';
import 'package:ecommerce/screens/user/user_screen.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': 'Home'},
      {'page': FeedsScreen(), 'title': 'Feeds'},
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom ==
              0.0, // hide fab when keyboard push
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            tooltip: 'Search',
            elevation: 5,
            onPressed: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
            child: Icon(
              kSearch,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
