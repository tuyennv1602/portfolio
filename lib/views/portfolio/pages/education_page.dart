import 'package:flutter/material.dart';
import '../../../core_packages.dart';
import '../../../data/data.dart';
import '../../../shared/shared.dart';
import '../model/portfolio_model.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<EducationEntity> educations = context.watch<PortfolioModel>().educations ?? [];
    return ListView.separated(
      itemBuilder: (_, index) {
        return _ItemEducation(education: educations[index]);
      },
      separatorBuilder: (_, __) => Divider(
        height: 1,
        indent: 30.w,
        endIndent: 30.w,
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
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            education.getLogo,
            width: 120.w,
            height: 150.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, top: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    education.school,
                    style: TextStyles.extraBig600,
                  ),
                  Text(
                    '(${education.time})',
                    style: TextStyles.big500.copyWith(color: theme.secondaryColor),
                  ),
                  Text(
                    'Majors: ${education.department} ∙ ${education.institute}',
                    style: TextStyles.big500,
                  ),
                  Text(
                    'Degree: ${education.degree}',
                    style: TextStyles.big500,
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
