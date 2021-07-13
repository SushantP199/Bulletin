import 'package:bulletin/config/theme.dart';
import 'package:bulletin/res/AppColors.dart';
import 'package:bulletin/res/Strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:bulletin/utils/country_category.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    final CountryCategory countryCategory = context.watch<CountryCategory>();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        border: Border.all(color: AppColors.white, width: 1.5.sp),
        borderRadius: BorderRadius.circular(10.0.sp),
      ),
      height: 6.0.h,
      width: 50.0.w,
      padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 1.0.h),
      child: DropdownButton<String>(
        dropdownColor: AppColors.darkGrey,
        value: _chosenValue,
        elevation: 5,
        style: AppTheme.setTextStyle(fontSize: 14.0.sp, color: AppColors.white),
        items: <String>[
          'business',
          'entertainment',
          'general',
          'health',
          'science',
          'sports',
          'technology'
        ].map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        hint: Text(
          AppStrings.category,
          style: AppTheme.setTextStyle(
            color: Colors.white,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value.toString();
          });

          countryCategory.category = value.toString();
        },
      ),
    );
  }
}
