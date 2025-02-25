import 'package:flutter/material.dart';
import 'package:onlineshop/view/Sign_Up_page.dart';
import 'package:onlineshop/view/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _parolController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Center(child: Image.asset("assets/images/login_img.png")),
              SizedBox(
                height: 50.0,
              ),
              Text(
                'Login to e-Shop',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50.0,
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
                            fillColor: Color(0x3232470D),
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
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Color(0xFFA8AFB9)),
                            fillColor: Color(0x3232470D),
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
                        height: 16.0,
                      ),
                      Text('Forgot Password?'),
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
                                    'Login',
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
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account?'),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Color(0xFFFC6828)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
