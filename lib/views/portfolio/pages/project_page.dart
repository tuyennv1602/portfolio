import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/gen/assets.gen.dart';
import '../../../core_packages.dart';
import '../../../data/data.dart';
import '../../../shared/shared.dart';
import '../model/portfolio_model.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProjectEntity> projects = context.watch<PortfolioModel>().projects ?? [];
    return Column(
      children: [
        Row(
          children: [],
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return _ItemProject(project: projects[index]);
            },
            separatorBuilder: (_, __) => Divider(
              height: 20.h,
              indent: 30.w,
              endIndent: 30.w,
            ),
            itemCount: projects.length,
          ),
        ),
      ],
    );
  }
}

class _ItemProject extends StatelessWidget {
  final ProjectEntity project;

  const _ItemProject({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    final _technologies = project.technology.split(',').map((t) => t.trim()).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30.w, 15.h, 30.w, 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                project.name,
                style: TextStyles.extraBig600,
              ),
              Text(
                project.duration,
                style: TextStyles.big400,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.w, 5.h, 30.w, 10.h),
          child: Text(
            project.description,
            style: TextStyles.medium400,
          ),
        ),
        Container(
          height: 30.h,
          margin: EdgeInsets.only(left: 30.w, top: 10.h, bottom: 20.h),
          padding: EdgeInsets.only(right: 20.w),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.h),
                  color: theme.primaryColor.withOpacity(0.2),
                ),
                child: Center(
                  child: Text(
                    _technologies[index],
                    style: TextStyles.medium500,
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemCount: _technologies.length,
          ),
        ),
        _MoreInformationItem(
          icon: Assets.icons.client.svg(width: 30.w, color: theme.secondaryColor),
          label: 'Client',
          value: project.client,
        ),
        _MoreInformationItem(
          icon: Assets.icons.working.svg(width: 30.w, color: theme.secondaryColor),
          label: 'Role',
          value: project.role,
        ),
        _MoreInformationItem(
          icon: Assets.icons.like.svg(width: 30.w, color: theme.secondaryColor),
          label: 'Responsibilities',
          value: project.responsibility.map((r) => '∙ $r').join('\n'),
        ),
        _MoreInformationItem(
          icon: Assets.icons.group.svg(width: 30.w, color: theme.secondaryColor),
          label: 'Team size',
          value: project.size,
        )
      ],
    );
  }
}

class _MoreInformationItem extends StatelessWidget {
  final SvgPicture icon;
  final String label;
  final String value;

  const _MoreInformationItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              SizedBox(width: 10.w),
              Text(
                label,
                style: TextStyles.medium400.copyWith(color: theme.secondaryColor, fontSize: 20.sp),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w, bottom: 15.h, top: 5.h),
            child: Text(
              value,
              style: TextStyles.medium500.copyWith(fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
