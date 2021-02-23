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
          onTap: (){Modular.to.pushNamed('/detail', arguments: [d], );},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            margin: EdgeInsets.fromLTRB(3, 5, 3, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
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
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                            '${d.strCategoryThumb}'),
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                  color: Colors.white.withOpacity(0.2),
                  ),
                  padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${d.strCategory}',
                        style: TextStyle(color: Colors.blue[900],
                        fontWeight: FontWeight.bold),
                      ),
                      Text('${d.strCategoryDescription}',
                          style: TextStyle(color: Colors.blue[900], fontSize: 12),overflow: TextOverflow.ellipsis,),
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
