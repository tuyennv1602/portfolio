import 'package:my_portfolio/shared/shared.dart';
import 'package:my_portfolio/shared/utils/utils.dart';

import '../../core_packages.dart';

class AppModel extends EasyNotifier {
  static AppTheme get _defaultTheme => AppTheme.fromType(ThemeType.dark);

  /// Settings
  // Current Theme
  AppTheme _theme = _defaultTheme;
  AppTheme get theme => _theme;
  set theme(AppTheme theme) => notify(() => _theme = theme);

  void changeTheme(bool isDark) {
    theme = AppTheme.fromType(isDark ? ThemeType.dark : ThemeType.light);
  }
}
