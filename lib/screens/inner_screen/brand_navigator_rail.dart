import 'package:ecommerce/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brand_rail.dart';

class BrandNavigationRailScreen extends StatefulWidget {
  BrandNavigationRailScreen({Key? key}) : super(key: key);

  static const routeName = '/brand_navigator_rail';
  @override
  _BrandNavigationRailScreenState createState() =>
      _BrandNavigationRailScreenState();
}

//1635286901373
class _BrandNavigationRailScreenState extends State<BrandNavigationRailScreen> {
  int _selectedIndex = 0;
  final padding = 2.0;
  late String routeArgs;
  late String brand;

  @override
  void didChangeDependencies() {
    routeArgs = ModalRoute.of(context)!.settings.arguments.toString();
    print(routeArgs.toString());
    _selectedIndex = int.parse(
      routeArgs.substring(1, 2),
    );
    print(routeArgs.toString());
    if (_selectedIndex == 0) {
      setState(() {
        brand = 'Acer';
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        brand = 'Asus';
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        brand = 'Apple';
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        brand = 'Dell';
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        brand = 'HP';
      });
    }
    if (_selectedIndex == 5) {
      setState(() {
        brand = 'Razer';
      });
    }
    if (_selectedIndex == 6) {
      setState(() {
        brand = 'Surface';
      });
    }
    if (_selectedIndex == 7) {
      setState(() {
        brand = 'All';
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      minWidth: 56.0,
                      groupAlignment: 1.0,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                          if (_selectedIndex == 0) {
                            setState(() {
                              brand = 'Acer';
                            });
                          }
                          if (_selectedIndex == 1) {
                            setState(() {
                              brand = 'Asus';
                            });
                          }
                          if (_selectedIndex == 2) {
                            setState(() {
                              brand = 'Apple';
                            });
                          }
                          if (_selectedIndex == 3) {
                            setState(() {
                              brand = 'Dell';
                            });
                          }
                          if (_selectedIndex == 4) {
                            setState(() {
                              brand = 'HP';
                            });
                          }
                          if (_selectedIndex == 5) {
                            setState(() {
                              brand = 'Razer';
                            });
                          }
                          if (_selectedIndex == 6) {
                            setState(() {
                              brand = 'Surface';
                            });
                          }
                          if (_selectedIndex == 7) {
                            setState(() {
                              brand = 'All';
                            });
                          }
                          print(brand);
                        });
                      },
                      labelType: NavigationRailLabelType.all,
                      leading: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: 16,
                              backgroundImage:
                                  Image.asset("assets/images/komkat.jpg").image,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      selectedLabelTextStyle: TextStyle(
                        color: Color(0xffffe6bc97),
                        fontSize: 20,
                        letterSpacing: 1,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.5,
                      ),
                      unselectedLabelTextStyle: TextStyle(
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                      destinations: [
                        buildRotatedTextRailDestination('Acer', padding),
                        buildRotatedTextRailDestination("Asus", padding),
                        buildRotatedTextRailDestination("Apple", padding),
                        buildRotatedTextRailDestination("Dell", padding),
                        buildRotatedTextRailDestination("HP", padding),
                        buildRotatedTextRailDestination("Razer", padding),
                        buildRotatedTextRailDestination("Surface", padding),
                        buildRotatedTextRailDestination("All", padding),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // This is the main content.
          ContentSpace(context, brand)
        ],
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
  );
}

class ContentSpace extends StatelessWidget {
  // final int _selectedIndex;

  final String brand;
  ContentSpace(BuildContext context, this.brand);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productByBrand =
        productProvider.productByBrand(brand); // brand == All return products
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.separated(
            itemCount: productByBrand.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: productByBrand[index],
              child: BrandsNavigationRail(),
            ),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
          ),
        ),
      ),
    );
  }
}
