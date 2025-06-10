import 'package:flutter/material.dart';
import 'package:serene/pages/auth/login_form.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    // Menunda eksekusi perpindahan halaman selama 3 detik
    Future.delayed(Duration(seconds: 3), () {
      // Berpindah ke halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginForm()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/logo.png', // Ganti dengan path logo Anda
          width: 100, // Sesuaikan ukuran logo
          height: 100, // Sesuaikan ukuran logo
        ),
      ),
    );
  }
}
