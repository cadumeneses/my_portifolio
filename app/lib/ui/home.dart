import 'package:flutter/material.dart';

import '../widgets/responsive_widget.dart';
import '../screens/utils/screen_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (ScreenUtil.getInstance().setWidth(108))), //144
        child: Scaffold(
          drawer: ResponsiveWidget.isSmallScreen(context)
              ? Drawer(
                  child: ListView(
                    padding: const EdgeInsets.all(20.0),
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'About',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Skills',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Contacts',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : null,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.grey,
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
                      color: Colors.white,
                      fontSize: 22.0, //22.0
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  TextSpan(
                    text: 'Eduardo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0, //22.0
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Skills',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              )
            ],
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return _body(context, constraints);
          }),
        ),
      ),
    );
  }
}

Widget _body(BuildContext context, BoxConstraints constraints) {
  return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: constraints.maxWidth,
        minHeight: constraints.maxHeight,
      ),
      child: ResponsiveWidget(
        largeScreen: _largeScreen(context),
        mediumScreen: Column(),
        smallScreen: Column(),
      ));
}

Widget _largeScreen(BuildContext context) {
  return IntrinsicHeight(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(flex: 1, child: _content(context)),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _content(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 0.0),
      _aboutMe(context),
      SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 0.0),
      _headline(context),
      SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 24.0),
      _description(),
      SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 48.0),
    ],
  );
}

Widget _aboutMe(BuildContext context) {
  return RichText(
      text: TextSpan(
    style: const TextStyle(
      color: Colors.black,
      fontSize: 14.0,
    ),
    children: [
      TextSpan(
        text: 'Sobre',
        style: TextStyle(
            fontSize: ResponsiveWidget.isSmallScreen(context) ? 36.0 : 45.0),
      ),
      TextSpan(
        text: 'Mim',
        style: TextStyle(
            fontSize: ResponsiveWidget.isSmallScreen(context) ? 36.0 : 45.0),
      ),
    ],
  ));
}

Widget _headline(BuildContext context) {
  return const Text(
    'Eu sou o Carlos Eduardo, Desenvolvedor de Aplicativos Mobile e Desenvolvedor Web',
    style: TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      color: Colors.white,
    ),
  );
}

Widget _description() {
  return const Padding(
    padding: EdgeInsets.only(right: 80.0),
    child: Text(
      'Focado em ser um profissional com excelentes habilidades tecnicas e uma ótima comunicação, com 2 anos de experiência no mercado de Desenvolvimento de Software. Tenho uma curva de aprendizagem muito boa para novas linguagens e frameworks. Cada dia mais "Pensando além do que os olhos conseguem ver" para encontrar soluções inovadoras para problemas críticos.',
      style: TextStyle(
          fontSize: 14.0, height: 1.5, letterSpacing: 1.0, color: Colors.black),
    ),
  );
}

final skills = [
  'Angular',
  'Dart',
  'Flutter',
  'Android',
  'iOS',
  'Web',
  'Programação assícrona',
  'Firebase',
  'Push Notification',
  'Desing responsivo',
  'SCRUM',
  'JavaScript',
  'TypeScript',
  'PostgreSql',
];

Widget _skills(BuildContext context) {
  final List<Widget> widgets = skills
      .map((skill) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text(skill),
            ),
          ))
      .toList();
  return Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Minhas habilidades',
        style: TextStyle(
          fontSize: 17.0,
          letterSpacing: 1.2,
        ),
      ),
      Wrap(children: widgets),
    ],
  );
}
