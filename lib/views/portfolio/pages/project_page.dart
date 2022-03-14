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
    AppTheme theme = context.watch<AppModel>().theme;
    List<ProjectEntity> projects = context.watch<PortfolioModel>().projects ?? [];
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) {
              return _ItemProject(project: projects[index]);
            },
            separatorBuilder: (_, __) => Divider(
              height: context.getSize(small: 15, large: 20),
              indent: context.getSize(small: 15, large: 30),
              endIndent: context.getSize(small: 15, large: 30),
              color: theme.dividerColor,
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
          padding: EdgeInsets.fromLTRB(
            context.getSize(small: 15, large: 30),
            context.getSize(small: 15, large: 15),
            context.getSize(small: 15, large: 30),
            5,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  project.name,
                  style: TextStyles.extraBig600.copyWith(
                    fontSize: context.getSize(
                      small: 22,
                      large: 32,
                    ),
                  ),
                ),
              ),
              Text(
                project.duration,
                style: TextStyles.big400.copyWith(
                  fontSize: context.getSize(small: 16, large: 24),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.getSize(small: 15, large: 30),
            context.getSize(small: 0, large: 5),
            context.getSize(small: 15, large: 30),
            10,
          ),
          child: Text(
            project.description,
            style: TextStyles.medium400.copyWith(
              fontSize: context.getSize(small: 16, large: 18),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.getSize(small: 15, large: 30)),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: context.getSize(small: 5, large: 15),
            runSpacing: context.getSize(small: 5, large: 10),
            children: _technologies
                .map(
                  (tech) => Chip(
                    backgroundColor: theme.primaryColor.withOpacity(0.2),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.getSize(small: 5, large: 15),
                    ),
                    label: Text(
                      tech,
                      style: TextStyles.medium500.copyWith(
                        fontSize: context.getSize(small: 15, large: 18),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: context.getSize(small: 15, large: 20)),
        _MoreInformationItem(
          icon: Assets.icons.client
              .svg(width: context.getSize(small: 20, large: 30), color: theme.secondaryColor),
          label: 'Client',
          value: project.client,
        ),
        _MoreInformationItem(
          icon: Assets.icons.working
              .svg(width: context.getSize(small: 20, large: 30), color: theme.secondaryColor),
          label: 'Role',
          value: project.role,
        ),
        _MoreInformationItem(
          icon: Assets.icons.like
              .svg(width: context.getSize(small: 20, large: 30), color: theme.secondaryColor),
          label: 'Responsibilities',
          value: project.responsibility.map((r) => '∙ $r').join('\n'),
        ),
        _MoreInformationItem(
          icon: Assets.icons.group
              .svg(width: context.getSize(small: 20, large: 30), color: theme.secondaryColor),
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
      padding: EdgeInsets.symmetric(horizontal: context.getSize(small: 15, large: 30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyles.medium400.copyWith(
                  color: theme.secondaryColor,
                  fontSize: context.getSize(small: 16, large: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.getSize(small: 30, large: 40),
              bottom: context.getSize(small: 10, large: 15),
              top: 5,
            ),
            child: Text(
              value,
              style: TextStyles.medium500.copyWith(fontSize: context.getSize(small: 16, large: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
