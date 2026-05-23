import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/core/theme_manager.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<ThemeManager>(ThemeManager(prefs));
}
