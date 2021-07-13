import 'package:bulletin/config/theme.dart';
import 'package:bulletin/res/AppColors.dart';
import 'package:bulletin/res/Strings.dart';
import 'package:bulletin/screens/EverythingPage.dart';
import 'package:bulletin/screens/TopHeadinesPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkGrey,
          elevation: 0,
          title: Text(
            AppStrings.app_name,
            style: AppTheme.setTextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 20.0.sp,
            ),
          ),
          bottom: TabBar(
            labelColor: AppColors.darkGrey,
            unselectedLabelColor: AppColors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0.sp),
                topRight: Radius.circular(12.0.sp),
              ),
            ),
            tabs: [
              Tab(
                child: Text(AppStrings.topHeadlines),
              ),
              Tab(
                child: Text(AppStrings.news),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [TopHeadlinesPage(), EverythingPage()],
        ),
      ),
    );
  }
}
