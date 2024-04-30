// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:task/HomePage.dart';
//
// class SignupPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   void _signup(BuildContext context) async {
//     FirebaseAuth _auth = FirebaseAuth.instance;
//
//     try {
//       UserCredential userCredential = await _auth
//           .createUserWithEmailAndPassword(
//           email: emailController.text,
//           password: passwordController.text);
//       User? user = userCredential.user;
//       if (user != null) {
//         // Signup successful, navigate to home page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       }
//     } catch (e) {
//       print('Error signing up: $e');
//       // Handle error here
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Signup'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () => _signup(context),
//               child: Text(
//                 'Signup',
//                 style: TextStyle(color: Colors.white),
//               ),
//               style: ButtonStyle(
//                 backgroundColor:
//                 MaterialStateProperty.all<Color>(Color(0xFF8A95D6)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SigninPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   void _signin(BuildContext context) async {
//     FirebaseAuth _auth = FirebaseAuth.instance;
//
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);
//       User? user = userCredential.user;
//       if (user != null) {
//         // Signin successful, navigate to home page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       }
//     } catch (e) {
//       print('Error signing in: $e');
//       // Handle error here
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Signin'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () => _signin(context),
//               child: Text(
//                 'Signin',
//                 style: TextStyle(color: Colors.white),
//               ),
//               style: ButtonStyle(
//                 backgroundColor:
//                 MaterialStateProperty.all<Color>(Color(0xFF8A95D6)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:task/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Color appColor = const Color(0xFF8A95D6);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Log in to your account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black87),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: '   Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set the border radius
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Adjust the vertical padding for a smaller height
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: '  Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set the border radius
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Adjust the vertical padding for a smaller height
                ),
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  Text('Remember for 30 days'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Log In'),
                style: ElevatedButton.styleFrom(primary: appColor),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Forgot password?'),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
