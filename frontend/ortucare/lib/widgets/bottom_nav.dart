import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ortucare/widgets/const.dart';

class BottomNav extends StatelessWidget {
  final int activePage;

  const BottomNav(this.activePage, {super.key});

  void _navigate(BuildContext context, int index) {
    switch (index) {
      case 0:
        if (activePage != 0) {
          Navigator.pushReplacementNamed(context, '/home');
        }
        break;
      case 1:
        if (activePage != 1) {
          Navigator.pushReplacementNamed(context, '/class');
        }
        break;
      case 2:
        if (activePage != 2) {
          Navigator.pushReplacementNamed(context, '/chat');
        }
        break;
      case 3:
        if (activePage != 3) {
          Navigator.pushReplacementNamed(context, '/profil');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: pinkTua.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -2), // shadow ke atas
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: activePage,
        onTap: (index) => _navigate(context, index),
        selectedItemColor: pinkTua,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: FaIcon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidNewspaper),
            label: 'Class',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidMessage),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidUser),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
