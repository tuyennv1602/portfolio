import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/data/data.dart';
import '../../../core_packages.dart';
import '../../../shared/shared.dart';
import '../model/portfolio_model.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SkillsEntity> skills = context.watch<PortfolioModel>().skills ?? [];
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      itemBuilder: (_, index) {
        final _skills = skills[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(
              icon: _skills.getIcon,
              title: _skills.type,
            ),
            ..._skills.items.map((item) => _SkillItem(item: item))
          ],
        );
      },
      itemCount: skills.length,
    );
  }
}

class _SkillItem extends StatelessWidget {
  final SkillsItemEntity item;
  const _SkillItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 10.h),
      child: item.value != null
          ? Text(
              '• ${item.label}: ${item.value!.join(', ')}',
              style: TextStyles.medium400,
            )
          : Text(
              '• ${item.label}',
              style: TextStyles.medium400,
            ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String icon;

  const _SectionHeader({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  String get _getTitle {
    switch (title) {
      case 'techincal_skills':
        return 'portfolio.technical_skills';
      case 'soft_skills':
        return 'portfolio.soft_skills';
      case 'language':
        return 'portfolio.language';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 45.w,
            color: theme.primaryColor,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                context.t(_getTitle),
                style: TextStyles.big600.copyWith(fontSize: 26.sp, color: theme.primaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
