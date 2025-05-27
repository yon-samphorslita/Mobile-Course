import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xFFFF8402);
    const unselectedColor = Color(0xFF393939);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0XFFD9D9D9), width: 0.5),
        ),
        child: ClipRRect(
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: selectedColor,
            unselectedItemColor: unselectedColor,
            onTap: onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 15,
            unselectedFontSize: 15,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              const BottomNavigationBarItem(
                icon: Center(child: Icon(Icons.search)),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/note.svg',
                    width: 24,
                    height: 24,
                    color: selectedIndex == 1 ? selectedColor : unselectedColor,
                  ),
                ),
                label: 'My courses',
              ),
              const BottomNavigationBarItem(
                icon: Center(child: Icon(Icons.play_circle)),
                label: 'Online course',
              ),
              BottomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/layer.svg',
                    width: 24,
                    height: 24,
                    color: selectedIndex == 3 ? selectedColor : unselectedColor,
                  ),
                ),
                label: 'Category',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
