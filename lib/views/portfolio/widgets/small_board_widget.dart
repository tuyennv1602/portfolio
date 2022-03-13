import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core_packages.dart';
import 'package:my_portfolio/shared/shared.dart';

import '../../../gen/assets.gen.dart';
import '../model/portfolio_model.dart';
import '../pages/contact_page.dart';
import '../pages/education_page.dart';
import '../pages/experience_page.dart';
import '../pages/project_page.dart';
import '../pages/skills_page.dart';
import '../pages/summary_page.dart';
import 'drawer_menu_widget.dart';

class SmallBoardWidget extends StatefulWidget {
  const SmallBoardWidget({Key? key}) : super(key: key);

  @override
  State<SmallBoardWidget> createState() => _SmallBoardWidgetState();
}

class _SmallBoardWidgetState extends State<SmallBoardWidget> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<PortfolioModel>().addListener(
      () {
        final _pageIndex = context.read<PortfolioModel>().currentPage.toPageIndex;
        if (_pageIndex != _currentPageIndex) {
          _pageController.jumpToPage(_pageIndex);
        }
        _currentPageIndex = _pageIndex;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    final PortfolioModel _portfolioModel = context.watch<PortfolioModel>();
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      drawer: Container(
        width: 280,
        height: double.infinity,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 0),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: const DrawerMenuWidget(),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Builder(builder: (context) {
                      return IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        onPressed: () {
                          context.openDrawer();
                        },
                        icon: Icon(Icons.menu, color: theme.secondaryColor),
                      );
                    }),
                  ),
                  Expanded(
                    child: Text(
                      context.t(_portfolioModel.currentPage.toPageLabel),
                      style: TextStyles.big600.copyWith(color: theme.primaryColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                        trackColor: Colors.grey[300],
                        activeColor: Colors.grey[300],
                        thumbColor: theme.primaryColor,
                        value: theme.isDark,
                        onChanged: (value) {
                          context.read<AppModel>().changeTheme(value);
                        },
                      ),
                    ),
                  ),
                  theme.isDark
                      ? Assets.icons.moon.svg(width: 18, color: Colors.white)
                      : Assets.icons.sun.svg(width: 22, color: Colors.amber),
                  const SizedBox(width: 10)
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
              pageSnapping: false,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                _portfolioModel.currentPage = index.toPageType;
              },
              controller: _pageController,
              scrollDirection: Axis.vertical,
              children: const [
                SummaryPage(),
                ExperiencePage(),
                SkillsPage(),
                ProjectPage(),
                EducationPage(),
                ContactPage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
