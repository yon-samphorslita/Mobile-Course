import 'package:flutter/material.dart';

import 'components/categorytab.dart';
import 'components/coursedetail.dart';
import 'components/footer.dart';
import 'components/header.dart';
import 'components/navigation.dart';
import 'components/searchbar.dart';

class CourseDetailPage extends StatefulWidget {
  final String keyword;

  const CourseDetailPage({super.key, required this.keyword});

  @override
  _CourseDetailPageState createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  int _selectedIndex = 0;

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
        scrollDirection: Axis.vertical,
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
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CategoryTabs(
                  selectedIndex: 0,
                  onTap: (index) => print('Tab: $index'),
                ),
              ),
              SizedBox(height: 20),
              CourseDetail(
                title: 'Computer Network',
                description:
                    'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally',
                iconPath: 'assets/images/image6.png',
                location: 'ភ្នំពេញ',
                count: '99 នាក់ចូលរៀន',
              ),
              CourseDetail(
                title: 'Computer Network',
                description:
                    'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally',
                iconPath: 'assets/images/image6.png',
                location: 'ភ្នំពេញ',
                count: '99 នាក់ចូលរៀន',
              ),
              CourseDetail(
                title: 'Computer Network',
                description:
                    'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally',
                iconPath: 'assets/images/image6.png',
                location: 'ភ្នំពេញ',
                count: '99 នាក់ចូលរៀន',
              ),
              CourseDetail(
                title: 'Computer Network',
                description:
                    'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally',
                iconPath: 'assets/images/image6.png',
                location: 'ភ្នំពេញ',
                count: '99 នាក់ចូលរៀន',
              ),
              CourseDetail(
                title: 'Computer Network',
                description:
                    'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally',
                iconPath: 'assets/images/image6.png',
                location: 'ភ្នំពេញ',
                count: '99 នាក់ចូលរៀន',
              ),
              CourseDetail(
                title: 'Computer Network',
                description:
                    'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally',
                iconPath: 'assets/images/image6.png',
                location: 'ភ្នំពេញ',
                count: '99 នាក់ចូលរៀន',
              ),
              CourseDetail(
                title: 'Computer Network',
                description:
                    'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally',
                iconPath: 'assets/images/image6.png',
                location: 'ភ្នំពេញ',
                count: '99 នាក់ចូលរៀន',
              ),
              CourseDetail(
                title: 'Computer Network',
                description:
                    'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally',
                iconPath: 'assets/images/image6.png',
                location: 'ភ្នំពេញ',
                count: '99 នាក់ចូលរៀន',
              ),
              SizedBox(height: 20),
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
