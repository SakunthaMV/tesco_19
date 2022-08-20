import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesco_19/Widgets/users.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tesco_19/homepage.dart';
import 'package:page_transition/page_transition.dart';

class LogInPage extends StatefulWidget {
  LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _userName;
  late String _password;

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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('images/Covid_Testing2.png'),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  width: width * 0.8,
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 186, 214, 238),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '- User Name -',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Container(
                              height: 40,
                              width: width * 0.6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                textInputAction: TextInputAction.next,
                                controller: _userNameController,
                                keyboardType: TextInputType.text,
                                onTap: () {
                                  setState(() {
                                    _userNameController.text = '';
                                  });
                                },
                                onChanged: (text) {
                                  if (text.isNotEmpty) {
                                    setState(() {
                                      _userName = text.trim();
                                    });
                                  }
                                },
                                onFieldSubmitted: (text) {
                                  if (text.isEmpty) {
                                    setState(() {
                                      _userNameController.text = '';
                                      _userName = '';
                                    });
                                  }
                                },
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter User Name';
                                  }
                                  return null;
                                },
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(bottom: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '- Password -',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Container(
                              height: 40,
                              width: width * 0.6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                onTap: () {
                                  setState(() {
                                    _passwordController.text = '';
                                  });
                                },
                                onChanged: (text) {
                                  if (text.isNotEmpty) {
                                    setState(() {
                                      _password = text.trim();
                                    });
                                  }
                                },
                                onFieldSubmitted: (text) {
                                  if (text.isEmpty) {
                                    setState(() {
                                      _passwordController.text = '';
                                      _password = '';
                                    });
                                  }
                                },
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter Valid Password';
                                  }
                                  return null;
                                },
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(bottom: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.8,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState!.validate();
                          if (isValid) {
                            if (users.containsKey(_userName)) {
                              if (users[_userName] == _password) {
                                Navigator.of(context).push(
                                  PageTransition(
                                    child: const HomePage(),
                                    type: PageTransitionType.leftToRight,
                                  ),
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: 'Your Password is Wrong.',
                                );
                              }
                            } else {
                              Fluttertoast.showToast(
                                msg: 'You are not a valid user.',
                              );
                            }
                          }
                        },
                        child: Text(
                          'Log In',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                    Text(
                      'or',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(
                      width: width * 0.8,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageTransition(
                              child: const HomePage(),
                              type: PageTransitionType.leftToRight,
                            ),
                          );
                        },
                        child: Text(
                          'Create an Account',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
