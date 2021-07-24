import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/screens/cart/cart.dart';
import 'package:ecommerce/screens/welcome/welcome.dart';
import 'package:ecommerce/screens/wishlist/wishlist.dart';
import 'package:ecommerce/services/firebase_authenticate.dart';
import 'package:ecommerce/services/firebase_firestore.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/utils/helper_method.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/user';
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final ScrollController _scrollController = ScrollController();
  double _top = 0.0;
  final AuthFirebase _auth = AuthFirebase();
  HelperMethod _helperMethod = HelperMethod();
  final FireDatabase _fireDatabase = FireDatabase();

  String _uid = '';
  String? _name;
  String _email = '';
  String _joinedDate = '';
  String? _imageUrl;
  int? _phoneNumber;

  final List<IconData> _userListTileIcon = [
    Icons.favorite_rounded,
    Icons.shopping_cart_rounded,
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.dark_mode,
    Icons.exit_to_app,
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {});
    });
    _getData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getData() async {
    final user = _auth.instance.currentUser;
    final uid = user!.uid;
    print(uid);
    final userDoc = await _fireDatabase.getUserInfoByUID(uid);
    print(userDoc);
    setState(() {
      _name = userDoc.get('name');
      _email = userDoc.get('email');
      _imageUrl = userDoc.get('imageUrl');
      _joinedDate = userDoc.get('joinedDate');
      _phoneNumber = userDoc.get('phoneNumber');
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).primaryColor,
                automaticallyImplyLeading: false,
                elevation: 5,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    _top = constraints.biggest.height;
                    return Container(
                      child: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        title: Row(
                          children: [
                            AnimatedOpacity(
                              opacity: _top <= 125 ? 1 : 0,
                              duration: const Duration(milliseconds: 200),
                              child: Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    height: kToolbarHeight / 1.8,
                                    width: kToolbarHeight / 1.6,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: kwhite,
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: _imageUrl == null
                                              ? Image.asset(
                                                      'assets/images/komkat.jpg',
                                                      fit: BoxFit.fill)
                                                  .image
                                              : Image.network(_imageUrl!).image,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Text(
                                    _name ?? _email,
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: kwhite,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        background: _imageUrl == null
                            ? Image.asset(
                                'assets/images/komkat.jpg',
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                _imageUrl!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, top: 20, bottom: 5),
                      child: userTile('User Bag'),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    userListTile(
                      'Wishlist',
                      0,
                      color: Colors.red,
                      trailing: Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.red,
                      ),
                      navigator: () => Navigator.of(context).pushNamed(
                        WishList.routeName,
                      ),
                    ),
                    userListTile(
                      'Cart',
                      1,
                      color: Theme.of(context).primaryColor,
                      trailing: Icon(
                        Icons.chevron_right_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      navigator: () => Navigator.of(context).pushNamed(
                        CartScreen.routeName,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, top: 10, bottom: 5),
                      child: userTile('User Infomation'),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    userListTile('Email', 2, subtitle: _email),
                    userListTile('Phone Number', 3,
                        subtitle: _phoneNumber?.toString() ?? 'No'),
                    userListTile('Shipping address', 4,
                        subtitle: 'address sub'),
                    userListTile('Joined Day', 5, subtitle: _joinedDate),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, top: 20, bottom: 5),
                      child: userTile('User Setting'),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    userListTile('Dark Mode', 6,
                        subtitle: 'Turn on/off dark mode',
                        isSwitchTitle: true,
                        provider: themeChange),
                    userListTile('Sign Out', 7, subtitle: 'Log out',
                        navigator: () {
                      _helperMethod.showAlertDialog(
                          title: 'Sign Out',
                          callBackFunc: () {
                            _auth.signOut().then((value) => Navigator.pushNamed(
                                context, WelcomeScreen.routeName));
                          },
                          context: context);
                    }),
                  ],
                ),
              ),
            ],
          ),
          customFAB(),
        ],
      ),
    );
  }

  Widget userTile(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget userListTile(String title, int index,
      {String? subtitle,
      Widget? trailing,
      Color? color,
      Function()? navigator,
      bool? isSwitchTitle,
      DarkThemeProvider? provider}) {
    return (isSwitchTitle != null && provider != null)
        ? SwitchListTile(
            activeColor: Theme.of(context).primaryColor,
            title: Text(
              title,
            ),
            subtitle: subtitle != null
                ? Text(
                    subtitle,
                  )
                : null,
            secondary: Icon(
              _userListTileIcon[index],
              color: color ?? null,
            ),
            onChanged: (bool value) {
              setState(() {
                provider.darkTheme = value;
              });
            },
            value: provider.darkTheme,
          )
        : Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: navigator,
              child: ListTile(
                title: Text(
                  title,
                ),
                subtitle: subtitle != null
                    ? Text(
                        subtitle,
                      )
                    : null,
                leading: Icon(
                  _userListTileIcon[index],
                  color: color ?? null,
                ),
                trailing: trailing ?? null,
              ),
            ),
          );
  }

  Widget customFAB() {
    const defaultTopMargin = 200.0 - 4.0;
    const scaleStart = 160.0;
    const scaleEnd = scaleStart / 2;

    var top = defaultTopMargin;
    var scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;

      if (offset < defaultTopMargin - scaleStart) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          heroTag: 'btn1',
          onPressed: () {},
          child: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
