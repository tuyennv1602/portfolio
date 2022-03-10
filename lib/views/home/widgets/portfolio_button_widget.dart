import 'package:flutter/material.dart';
import 'package:my_portfolio/shared/shared.dart';
import '../../../core_packages.dart';
import '../home_screens.dart';

class PortfolioButton extends StatefulWidget {
  const PortfolioButton({Key? key}) : super(key: key);

  @override
  State<PortfolioButton> createState() => _PortfolioButtonState();
}

class _PortfolioButtonState extends State<PortfolioButton> {
  double opacityLevel = 0;
  @override
  void initState() {
    Future.delayed(slideDuration).then((_) => _changeOpacity());
    super.initState();
  }

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opacityLevel,
      child: Container(
        margin: EdgeInsets.only(top: 40.h),
        height: 50.h,
        width: 180.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(50.h / 2),
        ),
        child: Center(
          child: Text(
            context.t('home.my_portfolio'),
            style: TextStyles.button.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ).clickable(() {
        context.appNavigator.toPortfolio();
      }),
    );
  }
}
