import 'package:bulletin/config/theme.dart';
import 'package:bulletin/res/AppColors.dart';
import 'package:bulletin/res/Strings.dart';
import 'package:bulletin/utils/country_category.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:country_codes/country_codes.dart';
import 'package:provider/provider.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  getCountry(CountryCategory countryCategory) async {
    await CountryCodes.init();
    final CountryDetails details = CountryCodes.detailsForLocale();

    countryCategory.country = details.alpha2Code.toString();
    countryCategory.countryname = details.localizedName.toString();

    print(details.alpha2Code);
    print(details.localizedName);
  }

  @override
  Widget build(BuildContext context) {
    final CountryCategory countryCategory = context.watch<CountryCategory>();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        border: Border.all(color: AppColors.lightGrey, width: 1.5.sp),
        borderRadius: BorderRadius.circular(10.0.sp),
      ),
      height: 5.4.h,
      width: 45.0.w,
      padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 0.5.h),
      child: GestureDetector(
        onTap: () {
          getCountry(countryCategory);
          print(countryCategory.country);
          print(countryCategory.countryname);
          print(countryCategory.category);
        },
        child: Center(
          child: Text(
            countryCategory.countryname == null ||
                    countryCategory.countryname == ''
                ? AppStrings.country
                : countryCategory.countryname,
            style: AppTheme.setTextStyle(
              color: Colors.white,
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
