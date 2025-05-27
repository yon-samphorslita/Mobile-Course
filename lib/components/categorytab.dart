import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CategoryTabs({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<String> tabs = const [
    'All (43)',
    'Courses (22)',
    'Projects (3)',
    'PRO sessions (3)',
    'Lecturers (3)',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () => onTap(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.orange : Colors.black,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 2,
                    width: 20,
                    color: Colors.orange,
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
