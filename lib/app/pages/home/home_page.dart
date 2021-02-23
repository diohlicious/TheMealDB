import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/home/home_bloc.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/pages/widgets/sliver_grid/sliver_grid_widget.dart';
import 'package:themealdb/app/pages/widgets/sliver_list/sliver_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

  class _HomePageState extends State<HomePage>{
    HomeBloc bloc;

    @override
    void initState() {
      super.initState();
      bloc = Modular.get<HomeBloc>();
      bloc.fetchCategories();
    }

    bool _switchList = true;
    setSwitchList(bool val){
      setState(() {
        _switchList = val;
      });
    }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CategoriesModel>(
        stream: bloc.categoriesModel$,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var d = snapshot.data;
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(
                      0.3, 3.0),
                  colors: [Colors.white, Colors.brown[900]],
                )
              ),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.black.withOpacity(0.3),
                    expandedHeight: 120,
                    //floating: true,
                    stretch: true,
                    pinned: true,
                    elevation: 0,
                    stretchTriggerOffset: 150,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Row(
                        children: [
                          Text('Categories',style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                          Spacer(),
                          IconButton(
                            icon: Icon(CupertinoIcons.rectangle_grid_2x2_fill),
                            color: Colors.white.withOpacity(0.8),
                            iconSize: 15,
                            tooltip: 'Grid',
                            onPressed: () {
                              setSwitchList(true);
                            },
                          ),
                          IconButton(
                            icon: Icon(CupertinoIcons.rectangle_grid_1x2_fill),
                            color: Colors.white.withOpacity(0.8),
                            iconSize: 15,
                            tooltip: 'List',
                            onPressed: () {
                              setSwitchList(false);
                            },
                          ),
                        ],
                      ),
                      stretchModes: [StretchMode.zoomBackground, StretchMode.fadeTitle],
                      background: Container(
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff23180d),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.brown),
                          image: DecorationImage(
                              scale: 1.3, image: AssetImage('assets/logo.png')),
                        ),
                      ),
                    ),
                  ),
                  SliverVisibility(
                      visible: _switchList,
                      sliver: SliverGridWidget(list: d.categories)),
                  SliverVisibility(
                      visible: !_switchList,
                      sliver: SliverListWidget(list: d.categories)),
                ],
              ),
            ),
          );
        });
  }
}
