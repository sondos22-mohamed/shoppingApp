import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey <FormState>() ;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  final RegExp mailform =RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  void login(){
    if (formKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey ,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Login to your account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "it's great to see you again.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Email'),
                  SizedBox(height: 5.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value==null || value.isEmpty) {return 'Email address must not be embty';}
                      else if(!mailform.hasMatch(value)){
                        return 'invaled Email Address';
                      }
                      else   return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email address',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Password'),
                  SizedBox(height: 5.0),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if(value==null || value.isEmpty)
                      {
                        return 'Password must not be embty';
                      }
                      else if(value.length <= 6){
                        return 'Invalid Password, password is too short';
                      }
                      else
                        return null;
                    },
                    controller: passwordController,
                    obscureText: isPassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock_open_outlined,
                        color: Colors.black45,
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(isPassword? Icons.visibility_off_outlined:Icons.visibility_outlined,
                          color: Colors.black45,),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text('Forgot your password?'),
                      TextButton(
                        onPressed: () {},
                        child: Text('Reset your password',
                          style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: ()
                    {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.pink,
                        // backgroundColor:formKey.currentState!.validate()? Colors.pink: Colors.pink[100],
                        minimumSize: Size(double.infinity, 40)
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(alignment: Alignment.center,
                      child: Text('Or')),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.g_mobiledata,
                          color: Colors.green,
                        ),
                        Text(
                          'Login with Google',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.facebook,
                          color: Colors.blue,
                        ),
                        Text('Login with Facebook',
                          style: TextStyle(
                            color: Colors.black,
                          ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
