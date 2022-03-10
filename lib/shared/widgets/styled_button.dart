import 'package:flutter/material.dart';
import 'package:my_portfolio/shared/shared.dart';

import '../../core_packages.dart';

class StyledButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final EdgeInsets? margin;

  const StyledButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch<AppModel>().theme;
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: theme.buttonColor,
        ),
        borderRadius: BorderRadius.circular(50.h / 2),
      ),
      child: Center(
        child: child,
      ),
    ).clickable(() {
      onPressed?.call();
    });
  }
}
