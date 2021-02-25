import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_const.dart';
import 'package:themealdb/app/pages/about/about_bloc.dart';

class AboutSectionWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    AboutBloc bloc = Modular.get<AboutBloc>();
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'This app is presented to ',
              style: TextStyle(
                  color: Colors.grey[600], letterSpacing: 2),
              children: [
                TextSpan(
                  text: 'Code{House} ',
                  style: TextStyle(color: Colors.blue[600]),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => bloc.launchUrl(urlCHouse),
                ),
                TextSpan(
                  text:
                  'by Tetra Sunu Dioh in order to complete Coding Test. \n\n',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                TextSpan(
                  text: 'With required apis are from ',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                TextSpan(
                  text: 'themealdb.com\n\n',
                  style: TextStyle(color: Colors.blue[900]),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => bloc.launchUrl(urlMealApi),
                ),
                TextSpan(
                  text:
                  'As an asessment you can compare with their webview ',
                  style: TextStyle(color: Colors.grey[600]),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => bloc.launchUrl(urlWeb),
                ),
                TextSpan(
                  text: 'Here.\n\n',
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {}, //TODO: Webview
                )
              ]),
        ),
      ],
    );
  }

}