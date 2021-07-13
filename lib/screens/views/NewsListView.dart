import 'package:bulletin/utils/lauch_url.dart';
import 'package:flutter/material.dart';
import 'package:bulletin/config/theme.dart';
import 'package:bulletin/res/AppColors.dart';
import 'package:bulletin/res/Strings.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsListView extends StatelessWidget {
  final AsyncSnapshot snapshot;
  NewsListView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: snapshot.data?.articles?.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
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
                      'PUBLISHED ON ${DateTime.parse('${snapshot.data?.articles?[index].publishedAt}').year}-${DateTime.parse('${snapshot.data?.articles?[index].publishedAt}').month}-${DateTime.parse('${snapshot.data?.articles?[index].publishedAt}').day} ${DateFormat('hh:mm a').format(DateTime.parse('${snapshot.data?.articles?[index].publishedAt}'))} ${DateTime.parse('${snapshot.data?.articles?[index].publishedAt}').timeZoneName}',
                      style: AppTheme.setTextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 10.0.sp,
                        color: AppColors.transperant,
                      ),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    CachedNetworkImage(
                      imageUrl: '${snapshot.data?.articles?[index].urlToImage}',
                      placeholder: (context, url) => CircularProgressIndicator(
                          color: AppColors.transperant),
                      errorWidget: (context, url, error) => Container(),
                    ),
                    /* Image(
                                image: NetworkImage(
                                  '${snapshot.data?.articles?[index].urlToImage}',
                                ),
                                fit: BoxFit.contain,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Container();
                                },
                              ),*/
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Text(
                      snapshot.data?.articles?[index].description != null
                          ? '${snapshot.data?.articles?[index].description}'
                          : '',
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
                        snapshot.data?.articles?[index].author != null
                            ? '- ${snapshot.data?.articles?[index].author} '
                            : '',
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
                    launchInBrowser(
                      '${snapshot.data?.articles?[index].url}',
                    );
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
        });
  }
}
