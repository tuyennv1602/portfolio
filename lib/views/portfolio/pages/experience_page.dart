import 'package:flutter/material.dart';
import '../../../core_packages.dart';
import '../../../data/data.dart';
import '../../../shared/shared.dart';
import '../model/portfolio_model.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    List<ExperienceEntity> experiences = context.watch<PortfolioModel>().experiences ?? [];
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: context.getSize(small: 10, large: 30)),
      itemBuilder: (BuildContext context, int index) {
        return _ExperienceItem(experience: experiences[index]);
      },
      itemCount: experiences.length,
      separatorBuilder: (_, index) => Divider(
        height: context.getSize(small: 15, large: 30),
        indent: context.getSize(small: 15, large: 30),
        endIndent: context.getSize(small: 15, large: 30),
        color: theme.dividerColor,
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
      padding: EdgeInsets.symmetric(
        horizontal: context.getSize(small: 15, large: 30),
        vertical: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            experience.getCompanyLogo,
            width: context.getSize(small: 50, large: 150),
            height: context.getSize(small: 50, large: 150),
          ),
          SizedBox(width: context.getSize(small: 15, large: 30)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.companyName,
                  style: TextStyles.extraBig600.copyWith(
                    fontSize: context.getSize(small: 20, large: 30),
                  ),
                ),
                Text(
                  '${experience.contract} ∙ ${experience.startTime} - ${experience.endTime ?? 'Present'}',
                  style: TextStyles.medium500.copyWith(
                    color: theme.secondaryColor,
                    fontSize: context.getSize(small: 15, large: 18),
                  ),
                ),
                ...experience.timelines.map(
                  (t) => Padding(
                    padding: EdgeInsets.only(top: context.getSize(small: 15, large: 20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: context.getSize(small: 12, large: 18),
                              height: context.getSize(small: 12, large: 18),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: context.getSize(small: 1, large: 1.5),
                                  color: Colors.grey,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  width: context.getSize(small: 5, large: 10),
                                  height: context.getSize(small: 5, large: 10),
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
                            Expanded(
                              child: Text(
                                t.title,
                                style: TextStyles.big500
                                    .copyWith(fontSize: context.getSize(small: 18, large: 22)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: context.getSize(small: 25, large: 28)),
                          child: Text(
                            t.description,
                            style: TextStyles.medium400.copyWith(
                                color: theme.secondaryColor,
                                fontSize: context.getSize(small: 14, large: 16)),
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
