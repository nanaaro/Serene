import 'package:flutter/material.dart';
import 'package:serene/pages/contact.dart';
import 'package:serene/pages/home.dart';
import 'package:serene/pages/portofolio.dart';
import 'package:serene/pages/profile.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;

  final List<Widget> pages = [HomePage(), PortofolioPage(), ContactPage(), ProfilePage()];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 26, 26, 26),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.draw),
            label: 'Portofolio',
            backgroundColor: Color.fromARGB(255, 26, 26, 26),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Kontak',
            backgroundColor: Color.fromARGB(255, 26, 26, 26),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color.fromARGB(255, 26, 26, 26),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); 
    super.dispose();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serene',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navbar(), // Menggunakan Navbar sebagai home
    );
  }
}
