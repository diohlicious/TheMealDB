import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:package_info/package_info.dart';
import 'package:themealdb/app/pages/drawer/repositories/drawer_repositories.dart';

import 'model/drawer_model.dart';

class DrawerBloc extends Disposable{
  final DrawerRepository drawerRepository;

  DrawerBloc(this.drawerRepository);

  final drawerItems = [
    DrawerModel("Meals DB", Icons.set_meal),
    DrawerModel("Favorite", CupertinoIcons.square_favorites_alt),
    DrawerModel("About", CupertinoIcons.info),
  ];

  int _selectedDrawerIndex = 0;

  int get selectedDrawerIndex => _selectedDrawerIndex;

  set selectedDrawerIndex(int val) {
    _selectedDrawerIndex = val;
    notifyListeners();
  }

  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  Future<void> initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    packageInfo = info;
  }

  Future onSelectItem(int index) async {
    selectedDrawerIndex=index;
    //print(index);
    // close the drawer
  }

  @override
  void dispose() {
  }

  void notifyListeners() {}
}