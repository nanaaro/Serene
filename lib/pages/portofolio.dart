import 'package:flutter/material.dart';
import 'apartement.dart'; 

class PortofolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0, 
        automaticallyImplyLeading: false, 
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ),
      backgroundColor: Colors.black, 
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/portofolio1.jpeg'),
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), // Mengatur eksposure
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPhotoWithText(
                  context,
                  'assets/portofolio2.jpeg',
                  'Skandinavian',
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.only(right: 2),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                _buildPhotoWithText(
                  context,
                  'assets/portofolio3.jpg',
                  'Kontemporer',
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                _buildPhotoWithText(
                  context,
                  'assets/portofolio4.jpeg',
                  'Tropis',
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.only(left: 2),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 8), // Jarak antara dua foto
                _buildPhotoWithText(
                  context,
                  'assets/portofolio5.jpeg',
                  'APARTEMEN',
                  height: 240,
                  width: 240,
                  exposure: 0.5,
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApartementPage()),
                    );
                  },
                ),
                SizedBox(width: 8), // Jarak antara dua foto
                _buildPhotoWithText(
                  context,
                  'assets/portofolio6.jpeg',
                  'RUMAH',
                  height: 240,
                  width: 240,
                  exposure: 0.5,
                  textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoWithText(
    BuildContext context,
    String imagePath,
    String label, {
    double width = 100,
    double height = 100,
    EdgeInsets? margin,
    double exposure = 0.5,
    TextStyle? textStyle,
    VoidCallback? onTap, // Tambahkan parameter onTap
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        width: width,
        height: height,
        child: Stack(
          children: [
            _buildPhotoWidget(context, imagePath, width: width, height: height, exposure: exposure),
            Center(
              child: Text(
                label,
                style: textStyle ?? TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white), // Gaya teks default
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoWidget(BuildContext context, String imagePath, {
    double width = 100,
    double height = 100,
    double exposure = 0.3,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(exposure),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }
}
