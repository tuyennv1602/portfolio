import 'package:flutter/material.dart';
import 'package:my_portfolio/gen/assets.gen.dart';
import '../../../core_packages.dart';
import '../home_screens.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: slideDuration,
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-2, 0),
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
      child: Hero(
        tag: 'avatar-widget',
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            shape: BoxShape.circle,
          ),
          child: Container(
            width: 280.w,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: ClipOval(child: Assets.images.avatar.image()),
          ),
        ),
      ),
    );
  }
}
