import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/gen/assets.gen.dart';
import 'package:my_portfolio/shared/shared.dart';
import 'package:my_portfolio/views/portfolio/model/portfolio_model.dart';
import 'package:my_portfolio/views/portfolio/pages/contact_page.dart';
import 'package:my_portfolio/views/portfolio/pages/education_page.dart';
import 'package:my_portfolio/views/portfolio/pages/experience_page.dart';
import 'package:my_portfolio/views/portfolio/pages/project_page.dart';
import 'package:my_portfolio/views/portfolio/pages/skills_page.dart';
import 'package:my_portfolio/views/portfolio/pages/summary_page.dart';
import 'package:my_portfolio/views/portfolio/widgets/drawer_menu_widget.dart';
import '../../../core_packages.dart';

class LargeBoardWidget extends StatefulWidget {
  const LargeBoardWidget({Key? key}) : super(key: key);

  @override
  State<LargeBoardWidget> createState() => _LargeBoardState();
}

class _LargeBoardState extends State<LargeBoardWidget> {
  late final PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: context.read<PortfolioModel>().currentPage.toPageIndex);
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 300,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: theme.dividerColor,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          context.t(_portfolioModel.currentPage.toPageLabel),
                          style: TextStyles.superBig700.copyWith(color: theme.primaryColor),
                        ),
                      ),
                      Transform.scale(
                        scale: 0.85,
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
                      theme.isDark
                          ? Assets.icons.moon.svg(width: 20, color: Colors.white)
                          : Assets.icons.sun.svg(width: 24, color: Colors.amber),
                    ],
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
          )
        ],
      ),
    );
  }
}
