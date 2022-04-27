import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibento_app/models/user_model.dart';
import 'package:ibento_app/pages/home_page.dart';
import 'package:ibento_app/pages/signin_screen.dart';
import 'package:ibento_app/pages/signup_screen.dart';
import 'package:ibento_app/providers/auth_provider.dart';
import 'package:ibento_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)),
      );
    }

    Widget header() {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 160.0, left: 40, right: 25),
          child: Column(
            children: [
              Text(
                "Register",
                style: GoogleFonts.poppins(
                  color: Color(0xff5168CA),
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget inputName() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0XFFF1F0F5),
              ),
              child: Center(
                child: TextFormField(
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Color(0XFF5669FF),
                  ),
                  cursorColor: Color(0XFF4141A4),
                  controller: nameController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Your full name',
                    hintStyle: GoogleFonts.poppins(
                      color: Color(0xff9FADBC),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0XFFF1F0F5),
              ),
              child: Center(
                child: TextFormField(
                  onChanged: (value) {},
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Color(0XFF5669FF),
                  ),
                  controller: emailController,
                  cursorColor: Color(0XFF4141A4),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Enter your email address',
                    hintStyle: GoogleFonts.poppins(
                      color: Color(0xff9FADBC),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0XFFF1F0F5),
              ),
              child: Center(
                child: TextFormField(
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Color(0XFF5669FF),
                  ),
                  controller: passwordController,
                  cursorColor: Color(0XFF4141A4),
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Your password',
                    hintStyle: GoogleFonts.poppins(
                      color: Color(0xff9FADBC),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputGoal() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0XFFF1F0F5),
              ),
              child: Center(
                child: TextFormField(
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Color(0XFF5669FF),
                  ),
                  controller: goalController,
                  cursorColor: Color(0XFF4141A4),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Your Goal',
                    hintStyle: GoogleFonts.poppins(
                      color: Color(0xff9FADBC),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        width: 300,
        height: 45,
        margin: EdgeInsets.only(top: 40, bottom: 20, left: 30, right: 30),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TextButton(
                onPressed: () async {
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      goalController.text.isEmpty) {
                    showError("semua fields harus diisi");
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    UserModel user = await authProvider.register(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                      goalController.text,
                    );

                    setState(() {
                      isLoading = false;
                    });

                    if (user == null) {
                      showError('email sudah terdaftar');
                    } else {
                      userProvider.user = user;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    }
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff718CFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(66),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
      );
    }

    Widget signUpText() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 65, right: 30),
        child: Row(
          children: [
            Text(
              "Already have an account?",
              style: GoogleFonts.poppins(
                color: Color(0xff120D26),
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(
                "Sign In",
                style: GoogleFonts.poppins(
                  color: Color(0xff5669FF),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.bottomLeft,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            header(),
            inputName(),
            inputEmail(),
            inputPassword(),
            inputGoal(),
            signUpButton(),
            signUpText(),
          ],
        ),
      ),
    );
  }
}
