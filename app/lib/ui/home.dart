import 'package:app/models/skill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:html' as html;

import '../screens/utils/custom_color.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/responsive_widget.dart';
import '../screens/utils/screen_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomColor.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (ScreenUtil.getInstance().setWidth(108))), //144
        child: Scaffold(
          drawer: ResponsiveWidget.isSmallScreen(context)
              ? const CustomDrawer()
              : null,
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
                      color: CustomColor.primaryColor,
                      fontSize: 22.0, //22.0
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  TextSpan(
                    text: 'Eduardo',
                    style: TextStyle(
                      color: CustomColor.secondaryColor,
                      fontSize: 22.0, //22.0
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),
            ),
            actions: ResponsiveWidget.isSmallScreen(context)
                ? null
                : [
                    TextButton(
                      onPressed: () {},
                      child: const SelectableText(
                        'Sobre Mim',
                        style: TextStyle(
                          color: CustomColor.actionColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const SelectableText(
                        'Habilidades',
                        style: TextStyle(
                          color: CustomColor.actionColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    Center(
                      child: PopupMenuButton(
                        tooltip: 'Meus contatos',
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: () => html.window.open(
                                "https://www.linkedin.com/in/carlos-eduardo-75a31521b/",
                                "LinkedIn",
                              ),
                              child: ListTile(
                                leading: SvgPicture.network(
                                  'https://github.githubassets.com/favicons/favicon.svg',
                                  height: 20,
                                ),
                                title: const Text('Github'),
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () => html.window.open(
                                "https://github.com/cadumeneses",
                                "Github",
                              ),
                              child: ListTile(
                                leading: SvgPicture.network(
                                  'https://static.licdn.com/sc/h/8a1a8xqjolkyjbf9n3i40oimj',
                                  height: 20,
                                ),
                                title: const Text('Linkedin'),
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () => html.window.open(
                                "https://wa.me/5588998638333",
                                "WhatsApp",
                              ),
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  'assets/images/whatsapp.svg',
                                  height: 20,
                                ),
                                title: const Text('WhatsApp'),
                              ),
                            ),
                          ];
                        },
                        child: const Text(
                          'Contatos',
                          style: TextStyle(
                            color: CustomColor.actionColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
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
        mediumScreen: _mediumScreen(context),
        smallScreen: _smallScreen(context),
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
              SvgPicture.asset(
                'assets/images/man_programmer.svg',
                height: ScreenUtil.getInstance().setHeight(980),
              )
            ],
          ),
        ),
        _footer(context),
      ],
    ),
  );
}

Widget _mediumScreen(BuildContext context) {
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
        ),
        _footer(context),
      ],
    ),
  );
}

Widget _smallScreen(BuildContext context) {
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
        ),
        _footer(context),
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
      _skillsAndEducation(context)
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
            fontSize: ResponsiveWidget.isSmallScreen(context) ? 36.0 : 45.0,
            color: CustomColor.primaryColor),
      ),
      TextSpan(
        text: ' Mim',
        style: TextStyle(
            fontSize: ResponsiveWidget.isSmallScreen(context) ? 36.0 : 45.0,
            color: CustomColor.secondaryColor),
      ),
    ],
  ));
}

Widget _headline(BuildContext context) {
  return const SelectableText(
    'Sou Carlos Eduardo, desenvolvedor de aplicativos mobile e web',
    style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      color: CustomColor.primaryColor,
    ),
  );
}

Widget _description() {
  return const Padding(
    padding: EdgeInsets.only(right: 80.0),
    child: SelectableText(
      'Com 2 anos de experiência no mercado de desenvolvimento de software, busco ser um profissional de excelência, com habilidades técnicas refinadas e capacidade de comunicação eficaz. Possuo uma curva de aprendizagem rápida para novas linguagens e frameworks e busco constantemente encontrar soluções inovadoras para problemas críticos, sempre "pensando além do que os olhos conseguem ver".',
      style: TextStyle(
          fontSize: 14.0,
          height: 1.5,
          letterSpacing: 1.0,
          color: CustomColor.primaryColor),
    ),
  );
}

Widget _skills(BuildContext context) {
  final List<Widget> widgets = skills
      .map((skill) => Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 5.0),
            child: Card(
              color: CustomColor.secondaryColor,
              elevation: 0,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Text(
                  skill.name,
                  style: TextStyle(
                    fontSize: ResponsiveWidget.isSmallScreen(context) ? 10 : 11,
                    color: CustomColor.actionColor,
                  ),
                ),
              ),
            ),
          ))
      .toList();
  return Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SelectableText(
        'Minhas habilidades',
        style: TextStyle(
            fontSize: 17.0,
            letterSpacing: 1.2,
            color: CustomColor.primaryColor),
      ),
      Wrap(children: widgets),
    ],
  );
}

Widget _education(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SelectableText(
        'Experiência',
        style: TextStyle(
          fontSize: 17.0,
          letterSpacing: 1.2,
          color: CustomColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SelectableText(
        'Desenvolvimento de aplicações web, layout e design responsivo: utilização do framework Angular; desenvolvimento de aplicações mobile: utilização de Dart, Flutter e Firebase; integração com API REST. Trabalho em equipe com metodologia SCRUM.',
        style: TextStyle(color: CustomColor.primaryColor),
      ),
      const SizedBox(height: 8.0),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SelectableText(
              'Desenvolvendor Full-Stack',
              style: TextStyle(
                fontSize: 15.0,
                letterSpacing: 1.0,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.primaryColor,
              ),
            ),
            SelectableText(
              'Brisanet Telecomunicações',
              style: TextStyle(
                fontSize: 12.0,
                letterSpacing: 1.0,
                height: 1.5,
                color: CustomColor.primaryColor,
              ),
            ),
            SelectableText(
              'Novembro/2021 - Atualmente',
              style: TextStyle(
                fontSize: 12.0,
                letterSpacing: 1.0,
                height: 1.5,
                color: CustomColor.primaryColor,
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget _skillsAndEducation(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(flex: 1, child: _education(context)),
      const SizedBox(width: 40.0),
      Expanded(flex: 1, child: _skills(context)),
    ],
  );
}

Widget _footer(BuildContext context) {
  return Column(
    children: [
      const Divider(
        color: CustomColor.primaryColor,
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                '© 2023  Desenvolvido por Carlos Eduardo',
                style: TextStyle(
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 8 : 10.0,
                  height: 1.5,
                  letterSpacing: 1.0,
                  color: Colors.grey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        html.window.open(
                            "https://www.linkedin.com/in/carlos-eduardo-75a31521b/",
                            "LinkedIn");
                      },
                      child: SvgPicture.network(
                          'https://static.licdn.com/sc/h/8a1a8xqjolkyjbf9n3i40oimj',
                          height: 20,
                          color: CustomColor.primaryColor)),
                  const SizedBox(width: 16.0),
                  InkWell(
                      onTap: () {
                        html.window
                            .open("https://github.com/cadumeneses", "Github");
                      },
                      child: SvgPicture.network(
                        'https://github.githubassets.com/favicons/favicon.svg',
                        color: CustomColor.primaryColor,
                        height: 20,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
