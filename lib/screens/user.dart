import 'package:ecommerece/provider/dark_theme_provider.dart';
import 'package:ecommerece/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ScrollController _scrollController = ScrollController();
  var top = 0.0;

  List<IconData> _userListTileIcon = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.dark_mode,
    Icons.exit_to_app,
  ];

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 5,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                top = constraints.biggest.height;
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    // gradient: LinearGradient(
                    //   begin: Alignment.topRight,
                    //   end: Alignment.bottomRight,
                    //   colors: [starterColor, endColor],
                    //   stops: [0, 1],
                    //   tileMode: TileMode.clamp,
                    // ),
                  ),
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle: true,
                    title: Row(
                      children: [
                        AnimatedOpacity(
                          opacity: top <= 125 ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 12),
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
                                      image: NetworkImage(
                                          'https://image.flaticon.com/icons/png/512/2037/2037413.png'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Text(
                                'Guest',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: kwhite,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    background: Image(
                      image: NetworkImage(
                          'https://image.flaticon.com/icons/png/512/2037/2037413.png'),
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
                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                  child: userTile('User Infomation'),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                userListTile('Email', 'email sub', 0),
                userListTile('Phone Number', 'phone sub', 1),
                userListTile('Email', 'email sub', 0),
                userListTile('Phone Number', 'phone sub', 1),
                userListTile('Email', 'email sub', 0),
                userListTile('Phone Number', 'phone sub', 1),
                userListTile('Shipping address', 'address sub', 2),
                userListTile('Joined Day', 'day sub', 3),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                  child: userTile('User Setting'),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                userListTile('Dark Mode', 'Turn on/off dark mode', 4,
                    isSwitchTitle: true, provider: themeChange),
                userListTile('Log out', 'Log out', 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget userTile(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget userListTile(String title, String subtitle, int index,
      {bool? isSwitchTitle, DarkThemeProvider? provider}) {
    return (isSwitchTitle != null && provider != null)
        ? SwitchListTile(
            title: Text(
              title,
            ),
            subtitle: Text(
              subtitle,
            ),
            secondary: Icon(
              _userListTileIcon[index],
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
              onTap: () {},
              child: ListTile(
                title: Text(
                  title,
                ),
                subtitle: Text(
                  subtitle,
                ),
                leading: Icon(
                  _userListTileIcon[index],
                ),
              ),
            ),
          );
  }
}
