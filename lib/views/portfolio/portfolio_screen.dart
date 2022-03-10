import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_portfolio/shared/shared.dart';
import 'package:my_portfolio/views/portfolio/model/portfolio_model.dart';
import 'package:my_portfolio/views/portfolio/widgets/large_board_widget.dart';
import '../../core_packages.dart';

Widget portfolioScreenBuilder(BuildContext context) => ChangeNotifierProvider<PortfolioModel>.value(
      value: GetIt.I<PortfolioModel>()
        ..getSummary()
        ..getSkills()
        ..getExperiences()
        ..getProjects()
        ..getEducations(),
      child: const PortfolioScreen(),
    );

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: const ResponsiveWidget(
        largeScreen: LargeBoard(),
      ),
    );
  }
}
