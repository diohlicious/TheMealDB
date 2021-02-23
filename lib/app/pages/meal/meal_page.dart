import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/widgets/sliver_meal/sliver_meal_widget.dart';

import 'meal_bloc.dart';
import 'model/meals_model.dart';

class MealPage extends StatelessWidget {
  final dynamic category;

  MealPage({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MealBloc bloc = Modular.get<MealBloc>();
    bloc.fetchMeal(category.strCategory??'');
    return StreamBuilder<MealsModel>(
        stream: bloc.mealsModel$,
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
                end: Alignment(0.3, 3.0),
                colors: [Colors.white, Colors.brown[900]],
              )),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white.withOpacity(0.0),
                    expandedHeight: 280,
                    //floating: true,
                    stretch: true,
                    pinned: true,
                    elevation: 0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        category.strCategory??'',
                        style: TextStyle(color: Colors.white),
                      ),
                      stretchModes: [
                        StretchMode.zoomBackground,
                        StretchMode.fadeTitle
                      ],
                      background: Container(
                        padding: EdgeInsets.fromLTRB(10, 8, 10, 38),
                        margin: EdgeInsets.fromLTRB(3, 10, 3, 10),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              category.strCategoryThumb??'${NetworkEndpoints.BASE_URL}/images/meal-icon.png',
                              scale: 1.5,
                            ),
                            Text(
                              category.strCategoryDescription,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12,
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 1.0,
                                    color: Colors.white,
                                  ),
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 1.0,
                                    color: Colors.black,
                                  ),
                                ],),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverMealWidget(list: d.meals??category.meals),
                ],
              ),
            ),
          );
        });
  }
}
