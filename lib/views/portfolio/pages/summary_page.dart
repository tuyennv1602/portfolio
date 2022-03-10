import 'package:flutter/material.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/gen/assets.gen.dart';
import 'package:my_portfolio/shared/shared.dart';
import '../../../core_packages.dart';
import '../model/portfolio_model.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final _tools = [
    Assets.images.flutterLogo,
    Assets.images.reactNativeLogo,
    Assets.images.androidLogo
  ];

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    SummaryEnitity? summary = context.watch<PortfolioModel>().summary;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          Text(
            'Tuyen Nguyen Van',
            style: TextStyles.superBig700.copyWith(color: theme.textColor, fontSize: 40.sp),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h, bottom: 30.h),
            child: Text(
              summary?.title ?? '',
              style: TextStyles.extraBig500.copyWith(color: theme.textColor),
            ),
          ),
          Expanded(
            child: Text(
              summary?.description ?? '',
              style: TextStyles.medium400.copyWith(color: theme.textColor),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Assets.images.appDevelopment.image(height: 150.h),
          ),
          Container(
            height: 60.h,
            margin: EdgeInsets.only(bottom: 30.h),
            alignment: Alignment.center,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => _tools[index].image(width: 60.w),
              separatorBuilder: (_, __) => SizedBox(width: 30.w),
              itemCount: _tools.length,
            ),
          )
        ],
      ),
    );
  }
}
