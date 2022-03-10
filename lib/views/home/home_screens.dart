import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/gen/assets.gen.dart';
import 'package:my_portfolio/shared/shared.dart';

import 'widgets/avatar_widget.dart';
import 'widgets/portfolio_button_widget.dart';
import 'widgets/welcom_text_widget.dart';

const slideDuration = Duration(seconds: 1);

Widget homeScreenBuilder(BuildContext context) => const HomeScreen();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.images.background.image(
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
                child: SafeArea(
                  child: ResponsiveWidget(
                    smallScreen: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        AvatarWidget(),
                        SizedBox(height: 30),
                        WelcomeText(),
                        SizedBox(height: 10),
                        PortfolioButton()
                      ],
                    ),
                    largeScreen: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AvatarWidget(),
                        const SizedBox(width: 40),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            WelcomeText(),
                            PortfolioButton(),
                          ],
                        ),
                      ],
                    ),
                    builder: (context, constraints, child) {
                      if (constraints.maxHeight < 690 && ResponsiveUtil.isSmallScreen(context)) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: child,
                          ),
                        );
                      }
                      return child;
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
