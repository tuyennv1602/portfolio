import 'package:flutter/material.dart';
import '../../../core_packages.dart';
import '../../../data/data.dart';
import '../../../shared/shared.dart';
import '../model/portfolio_model.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ExperienceEntity> experiences = context.watch<PortfolioModel>().experiences ?? [];
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      itemBuilder: (BuildContext context, int index) {
        return _ExperienceItem(experience: experiences[index]);
      },
      itemCount: experiences.length,
      separatorBuilder: (_, index) => Divider(
        height: 30.h,
        thickness: 1,
        indent: 30.w,
        endIndent: 30.w,
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final ExperienceEntity experience;

  const _ExperienceItem({
    Key? key,
    required this.experience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            experience.getCompanyLogo,
            width: 150.w,
            height: 150.w,
          ),
          SizedBox(width: 30.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.companyName,
                  style: TextStyles.extraBig600,
                ),
                Text(
                  '${experience.contract} ∙ ${experience.startTime} - ${experience.endTime ?? 'Present'}',
                  style:
                      TextStyles.medium500.copyWith(color: theme.secondaryColor, fontSize: 20.sp),
                ),
                ...experience.timelines.map(
                  (t) => Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 18.w,
                              height: 18.w,
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.grey,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  width: 10.w,
                                  height: 10.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.5,
                                      color: Colors.grey,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              t.title,
                              style: TextStyles.big500.copyWith(fontSize: 26.sp),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 28.w),
                          child: Text(
                            t.description,
                            style: TextStyles.medium400.copyWith(color: theme.secondaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
