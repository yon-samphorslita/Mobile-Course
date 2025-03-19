import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.brightness_5_outlined),
            color: Colors.white,
            padding: EdgeInsets.all(5),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.deepPurple[700]),
              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            onPressed: () {},
          ),
          title: const Text('CoolKid'),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset('images/pic.jpg'),
              ),
              const Text(
                'Welcome to my Portfolio',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Hi I'm",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                "Yon Samphorslita",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[700],
                ),
              ),
              const Text(
                "a Web Developer",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "at the ITC in the Department of Information and Communication Technology",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(height: 10),
              _buildButton(
                "Hire Me!",
                Colors.deepPurple,
                Colors.white,
                'mailto:yon.samphorslita@gmail.com',
              ),
              const SizedBox(height: 10),
              _buildButton(
                "Download CV",
                Colors.white,
                Colors.deepPurple,
                'https://www.linkedin.com/in/samphorslita-yon-004365215/',
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildButton(
    String text,
    Color bgColor,
    Color textColor,
    String url,
  ) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        fixedSize: const Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: Colors.deepPurple[700]!),
        ),
      ),
      onPressed: () => _launchURL(url),
      child: Text(text, style: const TextStyle(fontSize: 22)),
    );
  }
}

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    print('Could not launch $url');
  }
}
