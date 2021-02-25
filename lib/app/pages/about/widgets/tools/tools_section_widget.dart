import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_const.dart';

import '../../about_bloc.dart';

class ToolsSectionWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    AboutBloc bloc=Modular.get<AboutBloc>();
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
              text:
              'Archlinux\n',
              style: TextStyle(color: Colors.grey[600],letterSpacing: 3),
              children: [
                TextSpan(
                  text: 'OS\n\n',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 9),
                ),
                TextSpan(
                  text: 'studio.sh\n',
                  style: TextStyle(color: Colors.grey[600]),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => bloc.launchUrl(urlMail),
                ),
                TextSpan(
                  text: 'IDE\n\n',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 9),
                ),
                TextSpan(
                  text: 'Flutter & Dart\n',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                TextSpan(
                  text: 'SDK\n\n',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 9),
                ),
                TextSpan(
                  text: 'Dart\n',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                TextSpan(
                  text: 'LANGUAGE\n\n',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 9),
                ),
                TextSpan(
                  text: 'Modular\n',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                TextSpan(
                  text: 'PROJECT STRUCTURE\n\n',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 9),
                ),
                TextSpan(
                  text: 'RxDart\n',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                TextSpan(
                  text: 'STATE MANAGEMENT\n\n',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 9),
                ),
              ]),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              text: 'Http, Intl, Shared Preference, Package Info, URL Launcher, Material Design Icon Flutter.\n',
              style: TextStyle(color: Colors.grey[600], letterSpacing: 2),
              children: [
                TextSpan(
                  text: 'ANOTHER USEFULL PLUGINS\n\n',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 9),
                ),
              ]
            ),
          ),
        ),
        RichText(
          text: TextSpan(
              text: 'Studioh.id ©2021. Powered By ',
              style: TextStyle(color: Colors.grey[600],letterSpacing: 2, wordSpacing: 5),
              children: [
                TextSpan(
                    text: 'Flutter',
                    style: TextStyle(color: Colors.blueAccent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => bloc.launchUrl(urlFlutter)),
              ]),
        ),
      ],
    );
  }
}