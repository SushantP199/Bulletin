import 'package:bulletin/config/theme.dart';
import 'package:bulletin/res/AppColors.dart';
import 'package:bulletin/res/Strings.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:bulletin/utils/query.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    final Query query = context.watch<Query>();
    return Container(
      margin: EdgeInsets.only(top: 2.0.h, left: 1.0.w, right: 1.0.w),
      child: OutlineSearchBar(
        onSearchButtonPressed: (String? q) {
          query.q = q.toString();
          print(q.toString());
        },
        borderColor: AppColors.darkGrey,
        cursorColor: AppColors.white,
        hintText: AppStrings.search_with_keyword_or_phrases,
        hintStyle: AppTheme.setTextStyle(
            color: AppColors.transperant,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w500),
        searchButtonIconColor: AppColors.white,
        textStyle: AppTheme.setTextStyle(
            color: AppColors.white,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w500),
        backgroundColor: AppColors.darkGrey,
      ),
    );
  }
}
