import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static const _prefix = 'progress_';
  static const _bookmarkPrefix = 'bookmark_';

  static Future<void> markTabComplete(String moduleId, int tabIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${_prefix}${moduleId}_$tabIndex', true);
  }

  static Future<void> toggleTabComplete(String moduleId, int tabIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${_prefix}${moduleId}_$tabIndex';
    final current = prefs.getBool(key) ?? false;
    await prefs.setBool(key, !current);
  }

  static Future<bool> isTabComplete(String moduleId, int tabIndex) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('${_prefix}${moduleId}_$tabIndex') ?? false;
  }

  static Future<Map<int, bool>> getModuleProgress(String moduleId, int tabCount) async {
    final prefs = await SharedPreferences.getInstance();
    final map = <int, bool>{};
    for (var i = 0; i < tabCount; i++) {
      map[i] = prefs.getBool('${_prefix}${moduleId}_$i') ?? false;
    }
    return map;
  }

  static Future<double> getModuleCompletionPercent(String moduleId, int tabCount) async {
    if (tabCount == 0) return 0.0;
    final progress = await getModuleProgress(moduleId, tabCount);
    final completed = progress.values.where((v) => v).length;
    return completed / tabCount;
  }

  static Future<double> getOverallProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((k) => k.startsWith(_prefix)).toList();
    if (keys.isEmpty) return 0.0;
    final completed = keys.where((k) => prefs.getBool(k) ?? false).length;
    return completed / keys.length;
  }

  // Bookmarks
  static Future<void> toggleBookmark(String sectionKey) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_bookmarkPrefix$sectionKey';
    final current = prefs.getBool(key) ?? false;
    await prefs.setBool(key, !current);
  }

  static Future<bool> isBookmarked(String sectionKey) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('$_bookmarkPrefix$sectionKey') ?? false;
  }

  static Future<List<String>> getAllBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getKeys()
        .where((k) => k.startsWith(_bookmarkPrefix) && (prefs.getBool(k) ?? false))
        .map((k) => k.substring(_bookmarkPrefix.length))
        .toList();
  }
}
