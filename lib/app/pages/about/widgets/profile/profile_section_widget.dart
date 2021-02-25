import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:themealdb/app/network/network_const.dart';

import '../../about_bloc.dart';


class ProfileSectionWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    AboutBloc bloc=Modular.get<AboutBloc>();
    return Column(
      children: [
        SizedBox(
          height: 38,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:
                'Flutter Developer who loves to learn and focus on personal development.\n\n',
                style: TextStyle(color: Colors.grey[600], letterSpacing: 2,),
                children: [
                  TextSpan(
                    text: '08126902100\n',
                    style: TextStyle(color: Colors.blue[900]),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => bloc.launchUrl(urlWa),
                  ),
                  TextSpan(
                    text: 'Whatsapp\n\n',
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 10),
                  ),
                  TextSpan(
                    text: 'sunu@studioh.id\n',
                    style: TextStyle(color: Colors.blue[900]),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => bloc.launchUrl(urlMail),
                  ),
                  TextSpan(
                    text: 'email\n\n',
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 10),
                  ),
                  TextSpan(
                    text: 'studioh.id\n',
                    style: TextStyle(color: Colors.blue[900]),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => bloc.launchUrl(urlWeb),
                  ),
                  TextSpan(
                    text: 'Web\n\n',
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 10),
                  )
                ]),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    MdiIcons.facebook,
                    color: Colors.blue[900],
                  ),
                  onPressed: () => bloc.launchUrl(urlFb)),
              IconButton(
                icon: Icon(
                  MdiIcons.instagram,
                  color: Colors.blue[900],
                ),
                onPressed: () => bloc.launchUrl(urlIg),
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.linkedin,
                  color: Colors.blue[900],
                ),
                onPressed: () => bloc.launchUrl(urlIn),
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.filePdf,
                  color: Colors.blue[900],
                ),
                onPressed: () => bloc.launchUrl(urlCv),
              ),
            ],
          ),
        ),
      ],
    );
  }
}