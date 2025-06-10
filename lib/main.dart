import 'package:flutter/material.dart';
import 'pages/contact.dart';
import 'pages/navigation/navbar.dart';
import 'pages/auth/login_form.dart';
import 'pages/auth/register_form.dart';
import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/profile.dart';
import 'pages/portofolio.dart';
import 'pages/landingpage.dart';  
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Serene',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',

      // Daftar route aplikasi
      routes: {
        '/': (context) => LandingPage(), 
        '/login': (context) => LoginForm(),
        '/register': (context) => DaftarAkun(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/screen': (context) => Navbar(),
        '/contact': (context) => ContactPage(),
        '/about': (context) => AboutPage(),
        '/portofolio': (context) => PortofolioPage(),
      },
    );
  }
}
