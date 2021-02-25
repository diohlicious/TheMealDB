import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/pages/meal/meal_bloc.dart';
import 'package:themealdb/app/pages/widgets/sliver_meal/sliver_meal_widget.dart';

class MealPage extends StatelessWidget {
  final Category category;

  MealPage({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MealBloc bloc = Modular.get<MealBloc>();
    bloc.category = category;
    bloc.fetchMeal();
    return StreamBuilder<Category>(
        stream: bloc.detailModel$,
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
                        d.strCategory,
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
                              d.strCategoryThumb,
                              //??'${NetworkEndpoints.BASE_URL}/images/meal-icon.png',
                              scale: 1.5,
                            ),
                            Text(
                              d.strCategoryDescription,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverMealWidget(list: d.meals),
                ],
              ),
            ),
          );
        });
  }
}
