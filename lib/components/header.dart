import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Color(0xFF164F89)),
      title: Image.asset(
        'assets/images/image.png',
        width: 152.4,
        height: 30,
        fit: BoxFit.contain,
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        IconButton(icon: Icon(Icons.person), onPressed: () {}),
      ],
    );
  }
}
