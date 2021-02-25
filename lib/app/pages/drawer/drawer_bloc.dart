import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:package_info/package_info.dart';
import 'package:themealdb/app/pages/drawer/repositories/drawer_repositories.dart';
import 'package:themealdb/app/utils/shared_prefs_util.dart';

import 'model/drawer_model.dart';

class DrawerBloc extends Disposable {
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
    await sharedPrefs.init();
    await PackageInfo.fromPlatform().then((value) {
      packageInfo = value;
    });
    await drawerRepository.initFav();


  }

  Future onSelectItem(int index) async {
    selectedDrawerIndex = index;
  }

  @override
  void dispose() {
  }

  void notifyListeners() {}
}
