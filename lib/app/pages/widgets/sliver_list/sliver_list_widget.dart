import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SliverListWidget extends StatelessWidget {
  final List list;

  const SliverListWidget({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listItems = <Widget>[];
    for (var i = 0; i < list.length; i++) {
      var d = list[i];
      listItems.add(
        GestureDetector(
          onTap: (){Modular.to.pushNamed('/meal', arguments: d, );},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            margin: EdgeInsets.fromLTRB(3, 5, 3, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    3.0, 0.3), // 10% of the width, so there are ten blinds.
                colors: [Colors.white, Colors.brown[900], ], // red to yellow
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 120,
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                            '${d.strCategoryThumb}'),
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  padding: EdgeInsets.fromLTRB(5, 12, 5, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(
                          3.0, 0.3), // 10% of the width, so there are ten blinds.
                      colors: [Colors.white.withOpacity(0.0), Colors.white.withOpacity(0.5), ], // red to yellow
                      tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${d.strCategory}',
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                            Shadow(
                            offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.grey,
                  ),
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.black,
                  ),]
                        ),
                      ),
                      Text('${d.strCategoryDescription}',
                          style: TextStyle(color: Colors.brown[900], fontSize: 12),overflow: TextOverflow.ellipsis,),
                    ],
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
