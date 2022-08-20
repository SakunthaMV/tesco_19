import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
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
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 224, 241, 253),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                          color: Colors.black.withOpacity(0.5)
                        ),
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
                  Text(
                    'User Name',
                    style: Theme.of(context).textTheme.displaySmall
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: size.height * 0.5,
              width: size.width * 0.65,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.green),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.blue[200]),
                    child: const Center(
                      child: Text(
                        "20%",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // SizedBox(height: 10),
                  const SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(
                      image: AssetImage(
                        "images/Indicator.png",
                      ),
                    ),
                  ),
                  // SizedBox(height: 10),
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.blue[200]),
                      child: const Center(
                        child: Text(
                          "Button Text",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
