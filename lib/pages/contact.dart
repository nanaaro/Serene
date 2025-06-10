import 'package:flutter/material.dart';
import 'package:serene/pages/book.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool isRotated = false; // State untuk mengetahui apakah ikon berputar atau tidak

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(
            'assets/logo.png',
            width: 40,
            height: 40,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/contact2.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Informasi Perusahaan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.white),
              title: Text(
                'JL Dharmawangsa I A-70',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.white),
              title: Text(
                'serene.studio@outlook.com',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.white),
              title: Text(
                '024-7670990',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.access_time, color: Colors.white),
              title: Text(
                '09:00 AM - 04:00 PM',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isRotated = !isRotated;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookPage()),
            );
          });
        },
        backgroundColor: Colors.orange,
        child: Transform.rotate(
          angle: isRotated ? 90 * 3.14 / 180 : 0, 
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}