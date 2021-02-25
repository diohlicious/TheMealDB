import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/detail/model/detail.model.dart';
import 'package:themealdb/app/pages/meal/meal_bloc.dart';

class SliverMealWidget extends StatelessWidget {
  final List list;

  SliverMealWidget({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MealBloc bloc = Modular.get<MealBloc>();
    var listItems = <Widget>[];
    for (var i = 0; i < list.length; i++) {
      DetailModel d = list[i];
      listItems.add(
        GestureDetector(
          onTap: ()async{await Modular.to.pushNamed('/detail', arguments: d, ).then((value) => bloc.fetchMeal());},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            margin: EdgeInsets.fromLTRB(3, 5, 3, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    3.0, 0.3), // 10% of the width, so there are ten blinds.
                colors: [Colors.white, Colors.brown[900], ], // red to yellow
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                            '${d.strMealThumb}'),
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                  child: Text(
                    '${d.strMeal}',
                    textAlign: TextAlign.center,
                    style: TextStyle(//color: Colors.brown[800],
                        fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildListDelegate(listItems),
    );
  }
}
