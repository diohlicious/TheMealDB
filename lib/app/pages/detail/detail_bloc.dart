import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:themealdb/app/pages/detail/model/detail.model.dart';
import 'package:themealdb/app/pages/detail/repositories/detail_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBloc extends Disposable{
  final DetailRepository detailRepository;
  DetailBloc(this.detailRepository);

  BehaviorSubject<DetailModel> detailModel$ = BehaviorSubject<DetailModel>();

  Future fetchDetail(String idMeal) async {
    var _detailModel = await detailRepository.fetchDetail(idMeal);
    print (_detailModel.strIngredient);
    detailModel$.add(_detailModel);
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Icon searchIcon = Icon(CupertinoIcons.search);
  String _txtSearch;
  String get txtSearch => _txtSearch;
  setTxtSearch(String val){
    _txtSearch = val;
    notifyListener();
  }


  Widget appBarTitle;


  @override
  void dispose() {
    detailModel$.close();
  }

  void notifyListener() {}

}