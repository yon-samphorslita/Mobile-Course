import 'package:flutter/material.dart';

import 'components/article copy.dart';
import 'components/courselist.dart';
import 'components/footer.dart';
import 'components/header.dart';
import 'components/navigation.dart';
import 'components/searchbar.dart';

class CourseSearch extends StatefulWidget {
  @override
  _CourseSearchState createState() => _CourseSearchState();
}

class _CourseSearchState extends State<CourseSearch> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Searchbar(
                controller: TextEditingController(),
                onChanged: (value) => print('Search: $value'),
              ),
              SizedBox(height: 50),
              ArticleII(text: 'Explore your favorite subjects!'),
              SizedBox(height: 20),
              ArticleII(text: 'Build your competency with us!'),
              SizedBox(height: 20),
              ArticleII(text: 'Best recommended for you!'),
              SizedBox(height: 20),
              Courselist(title: 'Cyber Security'),
              SizedBox(height: 20),
              Courselist(title: 'Network Administrator'),
              SizedBox(height: 20),
              Courselist(title: 'Cryptography'),
              SizedBox(height: 80),
              Footer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
