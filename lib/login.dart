import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final ThemeMode themeMode;
  final void Function(bool) onThemeChanged;
  final String languageCode;
  final void Function(String) onLanguageChanged;
  final String greeting;
  final String login;

  const Login({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
    required this.languageCode,
    required this.onLanguageChanged,
    required this.greeting,
    required this.login,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              login,
              style: TextStyle(
                color: Color(0xFFFF7A00),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 3,
              width: 86,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFFF7A00),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/image1.png',
                    width: 322,
                    height: 55,
                  ),
                  SizedBox(height: 50),
                  Text(
                    greeting,
                    style: TextStyle(
                      color: Color(0xFFFF7A00),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Username',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Password',
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: 376,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(login),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF7A00),
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(width: 210, child: Divider()),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: _buildLangButton(
                                'assets/images/image2.png',
                                'en',
                                languageCode,
                                onLanguageChanged,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: _buildLangButton(
                                'assets/images/image3.png',
                                'fr',
                                languageCode,
                                onLanguageChanged,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: _buildLangButton(
                                'assets/images/image4.png',
                                'kh',
                                languageCode,
                                onLanguageChanged,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: 200,
                          child: SwitchListTile(
                            title: Text(
                              'Dark Mode',
                              style: TextStyle(fontSize: 16),
                            ),
                            value: themeMode == ThemeMode.dark,
                            onChanged: onThemeChanged,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLangButton(
    String imagePath,
    String code,
    String currentLang,
    void Function(String) onLanguageChanged,
  ) {
    final isActive = code == currentLang;
    return SizedBox(
      width: 88,
      height: 44,
      child: ElevatedButton(
        onPressed: () => onLanguageChanged(code),
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Color(0xFFFF7A00) : Colors.white,
          foregroundColor: isActive ? Colors.white : Color(0xFFFF7A00),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Color(0xFFFF7A00)),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(
            horizontal: 8,
          ), // Optional for tighter layout
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                imagePath,
                width: 27,
                height: 27,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 6),
            Text(code.toUpperCase()),
          ],
        ),
      ),
    );
  }
}
