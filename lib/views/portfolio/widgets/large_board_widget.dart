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
import '../../../core_packages.dart';

class LargeBoard extends StatefulWidget {
  const LargeBoard({Key? key}) : super(key: key);

  @override
  State<LargeBoard> createState() => _LargeBoardState();
}

class _LargeBoardState extends State<LargeBoard> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    final _size = MediaQuery.of(context).size;
    final _portfolioModel = context.watch<PortfolioModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 260.w,
          height: _size.height,
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
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: 'avatar-widget',
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 40),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: theme.primaryColor),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Assets.images.avatar.image(),
                        ),
                      ),
                    ),
                  ),
                  _MenuItem(
                    icon: Assets.icons.summary,
                    label: context.t('portfolio.summary'),
                    type: PageType.summary,
                    pageController: _pageController,
                  ),
                  _MenuItem(
                    icon: Assets.icons.timeline,
                    label: context.t('portfolio.experience'),
                    type: PageType.experience,
                    pageController: _pageController,
                  ),
                  _MenuItem(
                    icon: Assets.icons.skills,
                    label: context.t('portfolio.skills'),
                    type: PageType.skills,
                    pageController: _pageController,
                  ),
                  _MenuItem(
                    icon: Assets.icons.projects,
                    label: context.t('portfolio.projects'),
                    type: PageType.projects,
                    pageController: _pageController,
                  ),
                  _MenuItem(
                    icon: Assets.icons.education,
                    label: context.t('portfolio.education'),
                    type: PageType.education,
                    pageController: _pageController,
                  ),
                  _MenuItem(
                    icon: Assets.icons.contact,
                    label: context.t('portfolio.contact'),
                    type: PageType.contact,
                    pageController: _pageController,
                  ),
                  StyledButton(
                    margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
                    child: Text(
                      context.t('portfolio.download_cv'),
                      style: TextStyles.button.copyWith(color: theme.primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: SafeArea(
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
                          context.t(_portfolioModel.currentPage.toPageLabel).toUpperCase(),
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
          ),
        )
      ],
    );
  }
}

class _MenuItem extends StatefulWidget {
  final PageController pageController;
  final String label;
  final SvgGenImage icon;
  final PageType type;

  const _MenuItem({
    Key? key,
    required this.pageController,
    required this.label,
    required this.icon,
    required this.type,
  }) : super(key: key);

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  final ValueNotifier<bool> _hoverNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    final _portfolioModel = context.watch<PortfolioModel>();
    final _isSelected = _portfolioModel.currentPage == widget.type;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: double.infinity,
      padding: const EdgeInsets.only(right: 10),
      height: 65.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              theme.primaryColor.withOpacity(0.2),
              theme.primaryColor.withOpacity(0),
            ],
            begin: Alignment.centerLeft,
            end: _isSelected ? Alignment.centerRight : Alignment.centerLeft),
        border: Border(
          left: BorderSide(
            width: 3.w,
            color: _isSelected ? theme.primaryColor : theme.backgroundColor,
          ),
        ),
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: _hoverNotifier,
        builder: (_, isHover, __) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Center(
                  child: widget.icon.svg(
                    width: 32.w,
                    color: _isSelected || isHover ? theme.primaryColor : theme.secondaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  widget.label.toUpperCase(),
                  style: TextStyles.medium600.copyWith(
                    color: _isSelected || isHover ? theme.primaryColor : theme.secondaryColor,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ).clickable(() {
      _portfolioModel.currentPage = widget.type;
      widget.pageController.jumpToPage(widget.type.toPageIndex);
    }, onHover: (_) {
      _hoverNotifier.value = true;
    }, onExit: (_) {
      _hoverNotifier.value = false;
    });
  }
}
