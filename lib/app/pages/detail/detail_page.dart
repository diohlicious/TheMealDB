import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';

import 'detail_bloc.dart';
import 'model/detail.model.dart';

class DetailPage extends StatelessWidget {
  final DetailModel detailModel;

  DetailPage({
    Key key,
    this.detailModel,
  }) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    DetailBloc bloc = Modular.get<DetailBloc>();
    detailModel.strCategory==null?
    bloc.fetchDetail(detailModel.idMeal):
    bloc.detailModel$.add(detailModel);
    return StreamBuilder(
        stream: bloc.detailModel$,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var d = snapshot.data;
          return Scaffold(
            key: _scaffoldKey,
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(3.0, 0.3),
                  // 10% of the width, so there are ten blinds.
                  colors: [Colors.white, Colors.brown[500]],
                  // red to yellow
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.black.withOpacity(0.0),
                    //floating: true,
                    stretch: true,
                    pinned: true,
                    elevation: 0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Row(
                        children: [
                          Text('${d.strMeal}'),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: (){},
                          )
                        ],
                      ),
                      stretchModes: [
                        StretchMode.zoomBackground,
                        StretchMode.fadeTitle
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    image: DecorationImage(
                                      image: NetworkImage(d.strMealThumb),
                                    ),
                                  ),
                                  child: IconButton(
                                    color: Colors.blue[500].withOpacity(0.5),
                                    iconSize: 58,
                                    icon: Icon(Icons.play_circle_fill),
                                    onPressed: () {
                                      bloc.launchUrl(d.strYoutube);
                                    },
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Text(
                                          '${d.strMeal}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        '${d.strTags ?? ''}',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                              ),
                              child: GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                crossAxisCount: 5,
                                children:
                                    List.generate(d.strIngredient.length, (i) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(
                                              '${NetworkEndpoints.BASE_IMAGE}/${d.strIngredient[i]}.png'),
                                        )),
                                      ),
                                      Text(
                                        '${d.strMeasure[i]} ${d.strIngredient[i]}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Text(
                          'Instruction:',
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Text(
                            '${d.strInstructions}',
                            style: TextStyle(
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
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
