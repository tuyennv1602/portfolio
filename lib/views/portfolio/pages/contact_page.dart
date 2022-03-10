import 'package:flutter/material.dart';
import 'package:my_portfolio/gen/assets.gen.dart';
import '../../../core_packages.dart';
import '../../../shared/shared.dart';

const slideDuration = Duration(seconds: 1);

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: slideDuration,
    vsync: this,
  );
  late final Animation<Offset> _phoneAnimation = Tween<Offset>(
    begin: const Offset(-1, 0),
    end: const Offset(0, 0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.2, curve: Curves.fastLinearToSlowEaseIn),
    ),
  );
  late final Animation<Offset> _emailAnimation = Tween<Offset>(
    begin: const Offset(-1, 0),
    end: const Offset(0, 0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.4, curve: Curves.fastLinearToSlowEaseIn),
    ),
  );
  late final Animation<Offset> _skypeAnimation = Tween<Offset>(
    begin: const Offset(-1, 0),
    end: const Offset(0, 0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.4, 0.6, curve: Curves.fastLinearToSlowEaseIn),
    ),
  );

  late final Animation<Offset> _linkedinAnimation = Tween<Offset>(
    begin: const Offset(-1, 0),
    end: const Offset(0, 0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 0.8, curve: Curves.fastLinearToSlowEaseIn),
    ),
  );
  late final Animation<Offset> _githubAnimation = Tween<Offset>(
    begin: const Offset(-1, 0),
    end: const Offset(0, 0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.8, 1, curve: Curves.fastLinearToSlowEaseIn),
    ),
  );

  @override
  void initState() {
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thanks for visting my portfolio. You can contact me',
                  style: TextStyles.big400,
                ),
                SizedBox(height: 40.h),
                SlideTransition(
                  position: _phoneAnimation,
                  child: Row(
                    children: [
                      Assets.images.phone.image(width: 50.w),
                      SizedBox(width: 15.w),
                      Text(
                        '+84 374841404',
                        style: TextStyles.medium400,
                      ),
                    ],
                  ).clickable(() {}),
                ),
                SizedBox(height: 20.h),
                SlideTransition(
                  position: _emailAnimation,
                  child: Row(
                    children: [
                      Assets.images.email.image(width: 50.w),
                      SizedBox(width: 15.w),
                      Text(
                        'tuyennguyen160296@gmail.com',
                        style: TextStyles.medium400,
                      ),
                    ],
                  ).clickable(() {}),
                ),
                SizedBox(height: 20.h),
                SlideTransition(
                  position: _skypeAnimation,
                  child: Row(
                    children: [
                      Assets.images.skype.image(width: 50.w),
                      SizedBox(width: 15.w),
                      Text(
                        'https://join.skype.com/invite/DFtHbXDV8WhY',
                        style: TextStyles.medium400,
                      ),
                    ],
                  ).clickable(() {}),
                ),
                SizedBox(height: 20.h),
                SlideTransition(
                  position: _linkedinAnimation,
                  child: Row(
                    children: [
                      Assets.images.linkedin.image(width: 50.w),
                      SizedBox(width: 15.w),
                      Text(
                        'linkedin.com/in/tuyen-nguyen-238199179',
                        style: TextStyles.medium400,
                      ),
                    ],
                  ).clickable(() {}),
                ),
                SizedBox(height: 20.h),
                SlideTransition(
                  position: _githubAnimation,
                  child: Row(
                    children: [
                      Assets.images.github.image(width: 50.w),
                      SizedBox(width: 15.w),
                      Text(
                        'https://github.com/tuyennv1602',
                        style: TextStyles.medium400,
                      ),
                    ],
                  ).clickable(() {}),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Assets.images.laptop.image(
            width: 500.w,
          ),
        )
      ],
    );
  }
}
