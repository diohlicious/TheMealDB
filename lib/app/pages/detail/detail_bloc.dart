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
    detailModel$.add(_detailModel);
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool _onTap = false;
  bool get onTap => _onTap;
  set onTap(bool val){
    _onTap =val;
    notifyListener();
  }

  Future <String> setFav(DetailModel detailModel) async{
    return await detailRepository.setFav(detailModel);
  }

  Widget appBarTitle;

  @override
  void dispose() {
    detailModel$.close();
  }

  void notifyListener() {}

}