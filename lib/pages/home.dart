import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  final String greeting = _getGreeting();

  static String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'GOOD\nMORNING';
    } else if (hour < 15) {
      return 'GOOD\nAFTERNOON';
    } else if (hour < 18) {
      return 'GOOD\nEVENING';
    } else {
      return 'GOOD\nNIGHT';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideTransitionWidget(greeting: greeting),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(50, context, 'Recent'),
                  _buildButton(50, context, 'Popular'),
                  _buildButton(50, context, 'BestSeller'),
                ],
              ),
              SizedBox(height: 50),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin:
                                const EdgeInsets.only(right: 15, bottom: 20),
                            width: 250,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/home${index + 1}.jpeg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(double height, BuildContext context, String text) {
    return ElevatedButton(
      onPressed: () {
        // Add your onPressed logic here
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.orange;
            }
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(255, 255, 255, 255);
            }
            return const Color.fromARGB(255, 54, 54, 54);
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Color.fromARGB(255, 0, 0, 0);
          }
          if (states.contains(MaterialState.pressed)) {
            return Color.fromARGB(255, 80, 74, 68);
          }
          return Color.fromARGB(255, 255, 253, 253);
        }),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 27, vertical: 21),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SlideTransitionWidget extends StatefulWidget {
  final String greeting;
  SlideTransitionWidget({required this.greeting});

  @override
  _SlideTransitionWidgetState createState() => _SlideTransitionWidgetState();
}

class _SlideTransitionWidgetState extends State<SlideTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _dividerOffsetAnimation;
  late Animation<Offset> _greetingOffsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _dividerOffsetAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _greetingOffsetAnimation = Tween<Offset>(
      begin: Offset(-0.8, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    Future.delayed(Duration(milliseconds: 100), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SlideTransition(
              position: _dividerOffsetAnimation,
              child: Container(
                width: 5,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(width: 30),
            SlideTransition(
              position: _greetingOffsetAnimation,
              child: Text(
                widget.greeting,
                style: TextStyle(fontSize: 50, color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
