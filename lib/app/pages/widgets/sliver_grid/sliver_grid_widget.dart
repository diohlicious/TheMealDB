
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class SliverGridWidget extends StatelessWidget {
  final List list;

  const SliverGridWidget({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gridItems = <Widget>[];
    for (var i = 0; i < list.length; i++) {
      var d = list[i];
      gridItems.add(Container(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        height: 500,
        child: Column(
          children: [
            GestureDetector(
              onTap: (){Modular.to.pushNamed('/detail', arguments: d, );},
              child: Container(
                width: 170,
                height: 170,
                margin: EdgeInsets.fromLTRB(3, 6, 3, 0),
                padding: EdgeInsets.only(bottom: 3.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(9),
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                            '${d.strCategoryThumb}'))),
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white.withOpacity(0.3),
                      child: Text(
                        '${d.strCategory}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.grey,
                            ),
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 8.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              d.strCategoryDescription,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:Colors.brown,
                shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.black,
                ),
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.white,
                ),
              ],),
            )
          ],
        ),
      ));
    }
    return SliverGrid.count(
      children: gridItems,
      crossAxisCount: 2,
    );
  }
}
