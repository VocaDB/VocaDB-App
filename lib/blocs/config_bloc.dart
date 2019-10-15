import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocadb/app_theme.dart';

class ConfigBloc {
  BehaviorSubject<ThemeEnum> _themeData =
      new BehaviorSubject.seeded(ThemeEnum.Dark);
  BehaviorSubject<String> _contentLang = new BehaviorSubject.seeded('Default');
  BehaviorSubject<String> _rankingFilterBy = new BehaviorSubject();
  BehaviorSubject<String> _rankingVocalist = new BehaviorSubject();
  BehaviorSubject<String> _uiLang = new BehaviorSubject.seeded('en');

  Observable get themeDataStream => _themeData.stream;
  Observable get contentLangStream => _contentLang.stream;
  Observable get rankingFilterBy$ => _rankingFilterBy.stream;
  Observable get rankingVocalist$ => _rankingVocalist.stream;
  Observable get uiLang$ => _uiLang.stream;

  ThemeEnum get theme => _themeData.value;
  String get contentLang => _contentLang.value;
  String get rankingFilterBy => _rankingFilterBy.value;
  String get rankingVocalist => _rankingVocalist.value;
  String get uiLang => _uiLang.value;

  final SharedPreferences pref;

  Observable get uiConfigs$ => Observable.merge([uiLang$, themeDataStream]);

  ConfigBloc(this.pref) {
    initTheme();
    initContentLanguage();
    initRankingFilterBy();
    initRankingVocalist();
    initUILanguage();
  }

  void dispose() {
    _contentLang?.close();
    _themeData?.close();
    _rankingFilterBy?.close();
    _rankingVocalist?.close();
    _uiLang?.close();
  }

  void initTheme() async {
    String t = pref.getString('theme');
    if (t == ThemeEnum.Light.toString()) {
      updateTheme(ThemeEnum.Light);
    } else {
      updateTheme(ThemeEnum.Dark);
    }
  }

  void initContentLanguage() {
    String value = pref.getString('content_language') ?? 'Default';
    updateContentLanguage(value);
  }

  void initRankingFilterBy() {
    String value = pref.getString('ranking_filter_by');

    if (value != null) updateRankingFilterBy(value);
  }

  void initUILanguage() {
    String value = pref.getString('ui_language') ?? 'en';
    updateUILanguage(value);
  }

  void initRankingVocalist() {
    String value = pref.getString('ranking_vocalist');

    if (value != null) updateRankingVocalist(value);
  }

  void updateContentLanguage(String lang) {
    pref.setString('content_language', lang);
    _contentLang.add(lang);
  }

  void updateTheme(ThemeEnum selectedTheme) async {
    pref.setString('theme', selectedTheme.toString());
    _themeData.add(selectedTheme);
  }

  void updateRankingFilterBy(String rankingFilterBy) async {
    pref.setString('ranking_filter_by', rankingFilterBy);
    _rankingFilterBy.add(rankingFilterBy);
  }

  void updateRankingVocalist(String rankingVocalist) async {
    pref.setString('ranking_vocalist', rankingVocalist);
    _rankingVocalist.add(rankingVocalist);
  }

  void updateUILanguage(String uiLanguage) async {
    pref.setString('ui_language', uiLanguage);
    _uiLang.add(uiLanguage);
  }

  ThemeData getThemeData(ThemeEnum t) {
    switch (t) {
      case ThemeEnum.Dark:
        return AppTheme.darkTheme;
      case ThemeEnum.Light:
        return AppTheme.lightTheme;
      default:
        return AppTheme.darkTheme;
    }
  }
}
