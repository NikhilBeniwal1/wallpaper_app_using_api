import 'package:flutter/material.dart';
import 'download_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<Widget> listNavPages = [
    HomeScreen(),
    DownloadScreen(),
    ProfileScreen(),
    // WallPaperScreen(),
  ];

  int selectedPage = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listNavPages[selectedPage],
      bottomNavigationBar: NavigationBar(
        elevation: 5,
       // backgroundColor: Colors.grey.shade200,
        indicatorColor: Colors.green.shade200,
        selectedIndex: selectedPage,
        onDestinationSelected: (value) {
          selectedPage = value;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.window_sharp,
              color: Colors.grey.shade800,
            ),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.download,
              color: Colors.grey.shade800,
            ),
            label: "",
          ),
          NavigationDestination(
              icon: Icon(
                Icons.account_circle,
                color: Colors.grey.shade800,
              ),
              label: ""),
        ],
      ),
    );
  }
}


