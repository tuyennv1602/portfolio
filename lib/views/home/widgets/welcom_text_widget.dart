import 'package:flutter/material.dart';
import 'package:my_portfolio/shared/shared.dart';
import '../../../core_packages.dart';
import '../home_screens.dart';

class WelcomeText extends StatefulWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  State<WelcomeText> createState() => _WelcomeTextState();
}

class _WelcomeTextState extends State<WelcomeText> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: slideDuration,
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(2, 0),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  ));

  @override
  void initState() {
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Text(
        context.t('home.welcome'),
        style: TextStyles.extraBig600.copyWith(color: Colors.white).copyWith(fontSize: 34.sp),
      ),
    );
  }
}
