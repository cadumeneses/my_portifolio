import 'package:flutter/material.dart';

import '../screens/utils/custom_color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'About',
                style: TextStyle(
                  color: CustomColor.secondaryColor,
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
                  color: CustomColor.secondaryColor,
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
                  color: CustomColor.secondaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            )
          ],
        ),
      );
  }
}