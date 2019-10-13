import 'package:flutter/material.dart';
import 'package:fluttertinity/router.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key key}) : super(key: key);

  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final Widget menuDivider = Divider(
    height: 0.3,
    indent: 65,
    endIndent: 20,
    color: Colors.grey[300],
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: DrawerHeader(
                margin: EdgeInsets.all(10),
                child: Image.network(
                  'https://flutter.dev/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg',
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getDrawerListTile(
                      title: "Manage Users",
                      leading: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      backgroundCollor: Colors.blue[100],
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouterManager.usersPageRoute);
                      }),
                  menuDivider,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getDrawerListTile(
      {Color backgroundCollor = Colors.white,
      String title,
      Icon leading,
      Function onTap}) {
    return Material(
      color: backgroundCollor,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          enabled: true,
          leading: leading,
          title: Text(
            title,
          ),
          onTap: () {
            onTap();
          },
        ),
      ),
    );
  }
}
