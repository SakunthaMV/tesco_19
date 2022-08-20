import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesco_19/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: const Color.fromARGB(255, 186, 214, 238),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255,32,55,107),
            shape: const StadiumBorder(),
          )
        ),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 103, 152, 195),
        ),
        textTheme: TextTheme(
          titleMedium: const TextStyle(
            color: Colors.black
          ),
          displayMedium: GoogleFonts.openSans(
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
          labelMedium: GoogleFonts.rubikBeastly(
            textStyle: const TextStyle(
              fontSize: 20,
              letterSpacing: 1.1,
              color: Colors.white
            ),
          ),
        ),
      ),
      home: LogInPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10,top: 0,bottom: 0),
          child: Image.asset('images/logo.png'),
        ),
        title: RichText(
          text: TextSpan(
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.2
              ),
            ),
            children: const [
              TextSpan(
                text: 'Tes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.4
                ),
              ),
              TextSpan(
                text: 'CO - 19',
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Text(
              '_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
