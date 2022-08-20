import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 0, bottom: 0),
          child: Image.asset('images/logo.png'),
        ),
        title: Row(
          children: [
            const Expanded(child: SizedBox()),
            RichText(
              text: TextSpan(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.2,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        color: Colors.white.withOpacity(0.9),
                        blurRadius: 12,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                children: const [
                  TextSpan(
                    text: 'Tes',
                    style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.4),
                  ),
                  TextSpan(
                    text: 'CO - 19',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 224, 241, 253),
                        boxShadow: [
                          BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.5)),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.face,
                          size: 30,
                          color: Colors.purpleAccent,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('User Name', style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
              ),

              Image.asset('images/Covid_Testing2.png'),
              Container(
                height: height * 0.5,
                width: width * 0.8,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black.withOpacity(0.5),
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Present Status',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    Container(
                      height: 50,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.blue[200],
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "80%",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // SizedBox(height: 10),
                    SizedBox(
                      width: width * 0.5,
                      height: height * 0.2,
                      child: Stack(
                        children: [
                          Opacity(
                              opacity: 0.3,
                              child: Image.asset('images/Indicator.png', color: Colors.black)),
                          ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Image.asset('images/Indicator.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.7,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Check the Status',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        iconSize: 23,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
