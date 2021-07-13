import 'package:bulletin/blocs/everything_bloc.dart';
import 'package:bulletin/models/response/everything_response.dart';
import 'package:bulletin/res/AppColors.dart';
import 'package:bulletin/screens/views/NewsListView.dart';
import 'package:bulletin/utils/query.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class EverythingNews extends StatefulWidget {
  @override
  _EverythingNewsState createState() => _EverythingNewsState();
}

class _EverythingNewsState extends State<EverythingNews> {
  EverythingBloc everythingBloc = EverythingBloc();

  @override
  void dispose() {
    everythingBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Query query = context.watch<Query>();
    everythingBloc.fetchEverything(query.q);
    return StreamBuilder(
      stream: everythingBloc.getEverything,
      builder: (
        BuildContext context,
        AsyncSnapshot<EverythingResponse> snapshot,
      ) {
        print(snapshot.data);
        return Container(
          child: (snapshot.hasData)
              ? NewsListView(snapshot: snapshot)
              : Container(
                  margin: EdgeInsets.only(top: 30.0.h),
                  child: Icon(
                    Icons.search,
                    size: 50.0.sp,
                    color: AppColors.lightGrey,
                  ),
                ),
        );
      },
    );
  }
}
