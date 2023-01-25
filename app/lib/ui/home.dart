import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/utils/screen_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color(0xFFF5F5F5),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (ScreenUtil.getInstance().setWidth(108))), //144
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
                title: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.purple,
                ),
                children: [
                  TextSpan(
                    text: 'Carlos',
                    style: TextStyle(
                      color: Color.fromARGB(255, 82, 64, 160),
                      fontSize: 22.0, //22.0
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  TextSpan(
                    text: 'Eduardo',
                    style: TextStyle(
                      color: Color.fromARGB(255, 93, 95, 194),
                      fontSize: 22.0, //22.0
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
            )),
          ),
        ));
  }
}
