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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.getSize(small: 20, large: 30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.getSize(small: 20, large: 50)),
            Text(
              'Tuyen Nguyen Van',
              style: TextStyles.superBig700.copyWith(
                color: theme.textColor,
                fontSize: context.getSize(small: 32, large: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 30),
              child: Text(
                summary?.title ?? '',
                style: TextStyles.extraBig500.copyWith(
                  color: theme.textColor,
                  fontSize: context.getSize(small: 24, large: 32),
                ),
              ),
            ),
            Text(
              summary?.description ?? '',
              style: TextStyles.medium400.copyWith(
                color: theme.textColor,
                fontSize: context.getSize(small: 16, large: 18),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: context.getSize(small: 50, large: 100)),
                child: Assets.images.appDevelopment.image(
                  height: context.getSize(small: 120, large: 150),
                ),
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => _tools[index].image(
                  width: context.getSize(small: 50, large: 60),
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 30),
                itemCount: _tools.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
