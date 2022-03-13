import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core_packages.dart';
import '../../../gen/assets.gen.dart';
import '../model/portfolio_model.dart';
import 'package:my_portfolio/shared/shared.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
                width: context.getSize(small: 100, large: 120),
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
          ),
          _MenuItem(
            icon: Assets.icons.timeline,
            label: context.t('portfolio.experience'),
            type: PageType.experience,
          ),
          _MenuItem(
            icon: Assets.icons.skills,
            label: context.t('portfolio.skills'),
            type: PageType.skills,
          ),
          _MenuItem(
            icon: Assets.icons.projects,
            label: context.t('portfolio.projects'),
            type: PageType.projects,
          ),
          _MenuItem(
            icon: Assets.icons.education,
            label: context.t('portfolio.education'),
            type: PageType.education,
          ),
          _MenuItem(
            icon: Assets.icons.contact,
            label: context.t('portfolio.contact'),
            type: PageType.contact,
          ),
          StyledButton(
            onPressed: () async {
              launch(
                  'https://docs.google.com/document/d/1mW2ENqpOLh6GvWCoqvNP0W8uV1HgXpL6u1hR09we8lk/edit?usp=sharing');
            },
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Text(
              context.t('portfolio.download_cv'),
              style: TextStyles.button.copyWith(color: theme.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}

class _MenuItem extends StatefulWidget {
  final String label;
  final SvgGenImage icon;
  final PageType type;

  const _MenuItem({
    Key? key,
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
      height: context.getSize(small: 60, large: 65),
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
            width: 3,
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
                    width: context.getSize(small: 28, large: 32),
                    color: _isSelected || isHover ? theme.primaryColor : theme.secondaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  widget.label,
                  style: TextStyles.medium600.copyWith(
                    color: _isSelected || isHover ? theme.primaryColor : theme.secondaryColor,
                    fontSize: context.getSize(small: 18, large: 20),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ).clickable(() {
      _portfolioModel.currentPage = widget.type;
      if (context.isOpeningDrawer) {
        Navigator.of(context).pop();
      }
    }, onHover: (_) {
      _hoverNotifier.value = true;
    }, onExit: (_) {
      _hoverNotifier.value = false;
    });
  }
}
