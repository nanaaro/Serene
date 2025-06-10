import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
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
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 0), // Menghilangkan SizedBox untuk menaikkan elemen
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Mengurangi ukuran SizedBox untuk menaikkan elemen
            Container(
              width: 350,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 53, 53, 53),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Appointment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'No. Telp',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Tanggal',
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Jam',
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Mengurangi ukuran SizedBox untuk menaikkan elemen
            Container(
              width: 350, 
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk tombol submit di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Menghilangkan kelengkungan
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika untuk aksi ketika tombol floating action ditekan di sini
        },
        child: Icon(Icons.edit_document),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
