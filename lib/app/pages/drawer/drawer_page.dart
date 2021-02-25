import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/views/about_view.dart';
import 'package:themealdb/app/pages/views/favorite_views.dart';
import 'package:themealdb/app/pages/views/home_views.dart';

import 'drawer_bloc.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
  }

class _DrawerPageState extends State<DrawerPage>{
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeView(); //HomeView();
      case 1:
        return FavoriteView();
      case 2:
        return AboutView();
      default:
        return Text('No View For This Menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    DrawerBloc bloc = Modular.get<DrawerBloc>();
    bloc.initPackageInfo();
    var drawerOptions = <Widget>[];
    for (var i = 0; i < bloc.drawerItems.length; i++) {
      var d = bloc.drawerItems[i];
      drawerOptions.add(
        ListTileTheme(
          selectedColor: Colors.blue[200],
          textColor: Colors.white,
          iconColor: Colors.white,
          child: ListTile(
            leading: Icon(d.icon),
            title: Text(
              d.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            selectedTileColor: Colors.black.withOpacity(0.3),
            selected: i == bloc.selectedDrawerIndex,
            onTap: () => bloc.onSelectItem(i).then((value) => Navigator.of(context).pop())
          ),
        ),
      );
    }
    return Scaffold(
        drawer: Container(
          width: 250,
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              //other styles
            ),
            child: Drawer(
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.green.withOpacity(0.5),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.brown[900].withOpacity(0.5),
                        BlendMode.luminosity),
                    image: AssetImage('assets/drawer_background.jpg'),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.brown[700].withOpacity(0.8),
                                Colors.white.withOpacity(0.38),
                              ]),
                          //borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        ),
                        currentAccountPicture: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      '${NetworkEndpoints.BASE_URL}/images/meal-icon.png'))),
                        ),
                        accountName: Text('',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500)),
                        accountEmail: Text('')),
                    Column(children: drawerOptions),
                    Spacer(),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.red,
                      height: 8,
                    ),
                    ListTile(
                        title: Text(
                      'Version: ${bloc.packageInfo.version}',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: _getDrawerItemWidget(bloc.selectedDrawerIndex)
        );
  }
}
