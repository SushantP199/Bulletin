import 'package:bulletin/widgets/top_headlines.dart';
import 'package:bulletin/utils/country_category.dart';
import 'package:bulletin/widgets/SelectCategory.dart';
import 'package:bulletin/widgets/SelectCountry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class TopHeadlinesPage extends StatefulWidget {
  @override
  _TopHeadlinesPageState createState() => _TopHeadlinesPageState();
}

class _TopHeadlinesPageState extends State<TopHeadlinesPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountryCategory('US', '', ''),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 2.0.h, left: 1.0.w, right: 1.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectCountry(),
                  SelectCategory(),
                ],
              ),
            ),
            TopHeadlines(),
            SizedBox(height: 2.0.h),
          ],
        ),
      ),
    );
  }
}

/*
 topHeadlinesBloc.fetchTopHeadlines('us', '');
    return StreamBuilder(
      stream: topHeadlinesBloc.topHeadlines,
      builder:
          (BuildContext context, AsyncSnapshot<TopHeadlinesResponse> snapshot) {
        return Container(
          child: (snapshot.hasData)
              ? ListView.builder(
                  itemCount: snapshot.data?.articles?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          child: CountryListPick(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.darkGrey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0.sp),
                              topRight: Radius.circular(5.0.sp),
                            ),
                          ),
                          margin: EdgeInsets.only(
                            left: 1.0.w,
                            right: 1.0.w,
                            top: 1.0.h,
                          ),
                          padding: EdgeInsets.all(10.0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${snapshot.data?.articles?[index].title}',
                                textAlign: TextAlign.start,
                                style: AppTheme.setTextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0.sp,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(
                                height: 2.0.h,
                              ),
                              Text(
                                'PUBLISHED ON ${snapshot.data?.articles?[index].publishedAt}',
                                style: AppTheme.setTextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10.0.sp,
                                  color: AppColors.transperant,
                                ),
                              ),
                              SizedBox(
                                height: 2.0.h,
                              ),
                              Image(
                                image: NetworkImage(
                                  '${snapshot.data?.articles?[index].urlToImage}',
                                ),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                height: 2.0.h,
                              ),
                              Text(
                                '${snapshot.data?.articles?[index].description}',
                                textAlign: TextAlign.left,
                                style: AppTheme.setTextStyle(
                                  fontSize: 12.0.sp,
                                  color: AppColors.transperant,
                                ),
                              ),
                              SizedBox(
                                height: 2.0.h,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '- ${snapshot.data?.articles?[index].author} ',
                                  style: AppTheme.setTextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12.0.sp,
                                    color: AppColors.transperant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.0.sp),
                              bottomRight: Radius.circular(5.0.sp),
                            ),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 1.0.w),
                          height: 6.0.h,
                          child: InkWell(
                            onTap: () {
                              print("object");
                            },
                            child: Center(
                              child: Text(
                                AppStrings.full_coverage_of_this_story,
                                style: AppTheme.setTextStyle(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
    */