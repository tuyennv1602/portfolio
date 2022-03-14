import 'package:flutter/material.dart';
import '../../../core_packages.dart';
import '../../../data/data.dart';
import '../../../shared/shared.dart';
import '../model/portfolio_model.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;

    List<EducationEntity> educations = context.watch<PortfolioModel>().educations ?? [];
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 0),
      itemBuilder: (_, index) {
        return _ItemEducation(education: educations[index]);
      },
      separatorBuilder: (_, __) => Divider(
        height: 1,
        indent: context.getSize(small: 15, large: 30),
        endIndent: context.getSize(small: 15, large: 30),
        color: theme.dividerColor,
      ),
      itemCount: educations.length,
    );
  }
}

class _ItemEducation extends StatelessWidget {
  final EducationEntity education;
  const _ItemEducation({Key? key, required this.education}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.getSize(small: 15, large: 30),
        vertical: context.getSize(small: 15, large: 30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            education.getLogo,
            width: context.getSize(small: 80, large: 120),
            height: context.getSize(small: 120, large: 150),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: context.getSize(small: 15, large: 30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    education.school,
                    style: TextStyles.extraBig600.copyWith(
                      fontSize: context.getSize(small: 18, large: 32),
                    ),
                  ),
                  Text(
                    '(${education.time})',
                    style: TextStyles.medium400.copyWith(
                        color: theme.secondaryColor,
                        fontSize: context.getSize(small: 16, large: 22)),
                  ),
                  Text(
                    '${education.department}${education.institute != null ? ' ∙ ${education.institute}' : ''}',
                    style:
                        TextStyles.big500.copyWith(fontSize: context.getSize(small: 16, large: 24)),
                  ),
                  if (education.degree != null)
                    Text(
                      'Degree: ${education.degree}',
                      style: TextStyles.big500
                          .copyWith(fontSize: context.getSize(small: 16, large: 24)),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
