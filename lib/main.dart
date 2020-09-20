import 'package:flutter/material.dart';
import 'package:sy_expedition_travel/global/size_config.dart';
import 'package:sy_expedition_travel/resources/colors.dart';
import 'package:sy_expedition_travel/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig.init(constraints, orientation);
                return MaterialApp(
                  title: 'Material App',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    brightness: Brightness.dark,
                    scaffoldBackgroundColor: KBlackColor,
                  ),
                  home: MainScreen(),
                );
              },
            ));
  }
}
