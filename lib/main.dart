import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  String _languageCode = 'en';

  final Map<String, Map<String, String>> localizedStrings = {
    'en': {'greeting': 'Hello!', 'login': 'Log in'},
    'fr': {'greeting': 'Salut!', 'login': 'Connexion'},
    'kh': {'greeting': 'សួស្តី!', 'login': 'ចូល'},
  };

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _themeMode = (pref.getBool('darkMode') ?? false)
          ? ThemeMode.dark
          : ThemeMode.light;
      _languageCode = pref.getString('language') ?? 'en';
    });
  }

  void _updateTheme(bool isDark) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('darkMode', isDark);
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _updateLanguage(String lang) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('language', lang);
    setState(() {
      _languageCode = lang;
    });
  }

  @override
  Widget build(BuildContext context) {
    final greeting = localizedStrings[_languageCode]?['greeting']??'Hello!';
    final login = localizedStrings[_languageCode]?['login']??'Log in';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light().copyWith(
        textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Ubuntu'),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Ubuntu'),
      ),
      home: Login(
        themeMode: _themeMode,
        onThemeChanged: _updateTheme,
        languageCode: _languageCode,
        onLanguageChanged: _updateLanguage,
        greeting: greeting,
        login: login,
      ),
    );
  }
}
