import 'package:flutter/material.dart';
import 'package:serene/pages/detail.dart';

class ApartementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'APARTEMENT',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/apartement1.jpg',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Serene Apartement',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16),
              Divider(thickness: 0.5, color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.location_on, size: 40, color: Colors.white),
                  Icon(Icons.square_rounded, size: 40, color: Colors.white),
                  Icon(Icons.apartment, size: 40, color: Colors.white),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Bandung', style: TextStyle(color: Colors.white)),
                    Text('19m2', style: TextStyle(color: Colors.white)),
                    Text('Apartement', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Divider(thickness: 0.5, color: Colors.white),
              SizedBox(height: 8),
              Text(
                'Rincian',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPriceDetailBox('Meja Makan Set', 'MÖRBYLÅNGA', 'Rp 3.659.876,-'),
                    SizedBox(height: 8),
                    _buildPriceDetailBox('Sofa', 'BACKSÄLEN', 'Rp 6.987.798,-'),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage()),
                        );
                      },
                      child: _buildPriceDetailBox('Furnish', 'Kronos', 'Rp 98.000,-/pcs'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceDetailBox(String title, String merk, String price) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                merk,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Text(
            price,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}