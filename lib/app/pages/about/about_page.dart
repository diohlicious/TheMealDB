import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/about/widgets/about/about_section_widget.dart';
import 'package:themealdb/app/pages/about/widgets/profile/profile_section_widget.dart';
import 'package:themealdb/app/pages/about/widgets/tools/tools_section_widget.dart';
import 'dart:math' as math;
class AboutPage extends StatelessWidget {
  SliverPersistentHeader _sliverHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 90.0,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Colors.white.withOpacity(0.1),
                  ]),
            ),
            child: Text(
              headerText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.white,
                  ),
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.grey[900],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.blue[900], Colors.red[900]],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 500.0, 0.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.grey[200],
              stretch: true,
              elevation: 0,
              pinned: true,
              expandedHeight: 300,
              collapsedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title:
                    Text(
                      'studioh.id',
                      style: TextStyle(
                          fontFamily: 'Zcool',
                          fontSize: 38,
                          color: Color(0xff065b9c)),
                    ),
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle
                  ],
                  background: Container(
                      child: Image.network(
                    'https://studioh.id/assets/images/dev/studiohbrush.png',
                    fit: BoxFit.cover,
                  ))),
            ),
            _sliverHeader('Profile'),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue.withOpacity(0),
                        Colors.blue.withOpacity(0),
                        Colors.white.withOpacity(0.0),
                      ]),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 90,
                        child: PhysicalModel(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          elevation: 5,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${NetworkEndpoints.BASE_GRAVATAR}/91725ed8ce8677e2697e79bcbea5d728'),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text:
                      'TETRA SUNU DIOH\n',
                      style: TextStyle(
                          fontFamily: 'Fredericka',
                          fontSize: 25,
                          foreground: Paint()..shader = linearGradient),
                        children: [
                          TextSpan(
                            text: 'Flutter Developer',
                            style: TextStyle(color: Colors.blue[900], fontSize: 18),
                          )]
                    ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            SliverFixedExtentList(
                itemExtent: 300.0,
                delegate: SliverChildListDelegate([
                  ProfileSectionWidget(),
                ])),
            _sliverHeader('About'),
            SliverFixedExtentList(
                itemExtent: 200.0,
                delegate: SliverChildListDelegate([
                  AboutSectionWidget(),
                ])),
            _sliverHeader('Tools'),
            SliverFixedExtentList(
                itemExtent: 400.0,
                delegate: SliverChildListDelegate([
                  ToolsSectionWidget(),
                ])),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
