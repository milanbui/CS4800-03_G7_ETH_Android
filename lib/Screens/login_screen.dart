import 'package:cs4800_cipher_app/Data/DummyData.dart';
import 'package:cs4800_cipher_app/Screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:cs4800_cipher_app/bottom_navigation_bar_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Expanded(
                flex: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Cipher", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
                      child: TextField(
                        controller: emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border:
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'email',
                          labelStyle: TextStyle(fontSize: 18, color: Color(0xFF7C7C7C)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border:
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'password',
                          labelStyle: TextStyle(fontSize: 18, color: Color(0xFF7C7C7C)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: (MediaQuery.of(context).viewInsets.bottom == 0) ? 30 : 50,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 95, 0, 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF000000),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(200, 35),
                        ),
                        child: Text("log in", style: TextStyle(fontSize: 18)),
                        onPressed: () {
                          if(emailController.text.compareTo(DummyData.UserEmail) == 0 &&
                          passwordController.text.compareTo(DummyData.UserPW) == 0 )
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BottomNavBarState()),
                              );
                            }
                          else
                            {
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                    title: Text("Wrong Credentials"),
                                    content: Text("Entered email or password does not match our records. Pleas try again.")
                                );
                              });
                            }
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpScreen())
                          );
                        },
                        child: Text("Don't have an account? Sign Up", style: TextStyle(color: Colors.black))
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}