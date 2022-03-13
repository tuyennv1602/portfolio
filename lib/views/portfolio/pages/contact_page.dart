import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/gen/assets.gen.dart';
import '../../../core_packages.dart';
import '../../../shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/portfolio_model.dart';

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
  late final _animations = [
    Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.25, curve: Curves.fastLinearToSlowEaseIn),
      ),
    ),
    Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.4, curve: Curves.fastLinearToSlowEaseIn),
      ),
    ),
    Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.55, curve: Curves.fastLinearToSlowEaseIn),
      ),
    ),
    Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 0.7, curve: Curves.fastLinearToSlowEaseIn),
      ),
    ),
    Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 0.85, curve: Curves.fastLinearToSlowEaseIn),
      ),
    ),
    Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.85, 1, curve: Curves.fastLinearToSlowEaseIn),
      ),
    )
  ];

  @override
  void initState() {
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ContactEntity> contacts = context.watch<PortfolioModel>().contacts ?? [];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.getSize(small: 15, large: 30),
        vertical: context.getSize(small: 30, large: 40),
      ),
      child: Column(
        children: [
          Text(
            'Thanks for visting my portfolio. If you are interested in my work or if you like to collaborate or just say hello, feel free to contact me.',
            style: TextStyles.big400.copyWith(
              fontSize: context.getSize(small: 16, large: 22),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: context.getSize(small: 20, large: 30)),
                    itemBuilder: (_, index) {
                      final _contact = contacts[index];
                      return SlideTransition(
                        position: _animations[index],
                        child: Row(
                          children: [
                            Image.asset(_contact.getIcon,
                                width: context.getSize(small: 40, large: 50)),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                _contact.name,
                                style: TextStyles.medium400.copyWith(
                                  decoration: _contact.link != null
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  color: Colors.blue,
                                  fontSize: context.getSize(small: 16, large: 18),
                                ),
                              ),
                            ),
                          ],
                        ).clickable(() async {
                          if (_contact.link != null) {
                            if (await canLaunch(_contact.link!)) {
                              launch(_contact.link!);
                            } else {
                              Clipboard.setData(ClipboardData(text: _contact.link!));
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Copied: ${_contact.shortLink}'),
                              ));
                            }
                          }
                        }),
                      );
                    },
                    separatorBuilder: (_, __) =>
                        SizedBox(height: context.getSize(small: 15, large: 20)),
                    itemCount: contacts.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.getSize(small: 10, large: 20)),
                  child: Assets.images.laptop.image(
                    width: context.getSize(small: 150, large: 300, medium: 200),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
