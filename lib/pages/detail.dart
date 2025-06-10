import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: 50,
          height: 50,
          child: Image.asset('assets/logo.png'),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kronos - Clay Texture',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  child: Image.asset(
                    'assets/detail1.jpeg',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere nulla sed risus tincidunt, nec interdum magna viverra. Vivamus vehicula metus non elit elementum, nec volutpat ex hendrerit. Duis nec felis ac purus euismod feugiat. Nullam quis tellus euismod, pretium enim non, aliquet orci. Integer accumsan purus sit amet ligula ultrices, sed sodales ex feugiat. Morbi venenatis euismod nisl eu lobortis. Vestibulum quis libero vitae justo fringilla sollicitudin. Nulla facilisi. Duis ultricies odio in massa efficitur, sed consectetur velit luctus. Donec rhoncus justo eget mauris condimentum, sit amet commodo libero tempus. Sed feugiat dui vitae convallis sodales.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
