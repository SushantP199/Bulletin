import 'package:bulletin/config/theme.dart';
import 'package:bulletin/res/Strings.dart';
import 'package:bulletin/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(Bulletin());

class Bulletin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: AppStrings.app_name,
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    });
  }
}
