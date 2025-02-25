import 'package:flutter/material.dart';
import 'package:onlineshop/view/login_page.dart';

import 'home_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _parolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Center(child: Image.asset("assets/images/login_img.png")),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Sing Up to e-Shop',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          shadowColor: Colors.white,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Color(0xFFA8AFB9)),
                              prefixIcon: Icon(Icons.person),
                              prefixIconColor: Color(0xFFA8AFB9),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username kiriting';
                              }
                              return null;
                            },
                            controller: _usernameController,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          elevation: 5,
                          shadowColor: Colors.white,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Color(0xFFA8AFB9)),
                              prefixIcon: Icon(Icons.email),
                              prefixIconColor: Color(0xFFA8AFB9),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email kiriting';
                              }
                              return null;
                            },
                            controller: _emailController,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          elevation: 5,
                          shadowColor: Colors.white,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Color(0xFFA8AFB9)),
                              prefixIcon: Icon(Icons.lock),
                              prefixIconColor: Color(0xFFA8AFB9),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password kiriting';
                              }
                              return null;
                            },
                            controller: _parolController,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFC6828),
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                },
                                child: Container(
                                    padding: EdgeInsets.all(18.0),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(fontSize: 16.0),
                                    )))),
                      ],
                    )),
                SizedBox(
                  height: 18,
                ),
                Row(children: [
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Color(0xFFC4C4C4),
                  )),
                  Text(
                    ' Or ',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFFC4C4C4)),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Color(0xFFC4C4C4),
                  )),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16.0,
                  children: [
                    Image.asset('assets/images/facebook_icon.png'),
                    Image.asset('assets/images/google_icon.png'),
                    Image.asset('assets/images/app_icon.png'),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have account! '),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Color(0xFFFC6828)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
