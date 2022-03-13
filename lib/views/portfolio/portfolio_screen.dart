import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_portfolio/shared/shared.dart';
import 'package:my_portfolio/views/portfolio/model/portfolio_model.dart';
import 'package:my_portfolio/views/portfolio/widgets/large_board_widget.dart';
import 'package:my_portfolio/views/portfolio/widgets/small_board_widget.dart';
import '../../core_packages.dart';

Widget portfolioScreenBuilder(BuildContext context) => ChangeNotifierProvider<PortfolioModel>.value(
      value: GetIt.I<PortfolioModel>()
        ..getSummary()
        ..getSkills()
        ..getExperiences()
        ..getProjects()
        ..getEducations()
        ..getContacts(),
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
    return const ResponsiveWidget(
      largeScreen: LargeBoardWidget(),
      smallScreen: SmallBoardWidget(),
      mediumScreen: SmallBoardWidget(),
    );
  }
}
