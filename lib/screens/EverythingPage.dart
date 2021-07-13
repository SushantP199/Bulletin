import 'package:bulletin/config/theme.dart';
import 'package:bulletin/res/AppColors.dart';
import 'package:bulletin/utils/query.dart';
import 'package:bulletin/widgets/everything_news.dart';
import 'package:bulletin/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:provider/provider.dart';

class EverythingPage extends StatefulWidget {
  @override
  _EverythingPageState createState() => _EverythingPageState();
}

class _EverythingPageState extends State<EverythingPage> {
  // TextEditingController _q = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Query(''),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            EverythingNews(),
            SizedBox(height: 2.0.h),
          ],
        ),
      ),
    );
  }
}
