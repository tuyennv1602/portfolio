import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:my_portfolio/shared/shared.dart';
import 'core_packages.dart';
import 'di/di.dart';
import 'localizations/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await setupDi();
  runApp(const _AppBootStrapper());
}

class _AppBootStrapper extends StatefulWidget {
  const _AppBootStrapper({Key? key}) : super(key: key);

  @override
  State<_AppBootStrapper> createState() => _AppBootStrapperState();
}

class _AppBootStrapperState extends State<_AppBootStrapper> {
  late final AppRouteInformationParser _routeParser = AppRouteInformationParser();
  late final AppNavigator _router;

  @override
  void initState() {
    _router = AppNavigator(AppPageRoute.home());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<AppNavigator>.value(value: _router),
        ChangeNotifierProvider<AppModel>.value(value: GetIt.I()),
      ],
      child: Builder(builder: (context) {
        AppTheme theme = context.select((AppModel m) => m.theme);
        ThemeData materialTheme = theme.toThemeData();
        SystemChrome.setSystemUIOverlayStyle(
            theme.isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
        return ScreenUtilInit(
          designSize: const Size(1440, 761),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: () => MaterialApp.router(
            title: 'Tuyen Nguyen Porfolio',
            routeInformationParser: _routeParser,
            routerDelegate: _router,
            debugShowCheckedModeBanner: false,
            theme: materialTheme,
            builder: (context, child) {
              return MediaQuery(
                child: child!,
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              );
            },
            supportedLocales: const [Locale('en', 'US')],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          ),
        );
      }),
    );
  }
}
