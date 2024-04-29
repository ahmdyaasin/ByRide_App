import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/network/api/auth_api.dart';
import 'package:byride_app/page/user/home_page.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:byride_app/utils.dart/text_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final AuthApi authApi = getIt<AuthApi>();
  final PrefsHelper prefsHelper = getIt<PrefsHelper>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 23, 64, 136),
                    Color(0xff281537),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 22),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('BY',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: textWhite)),
                      Text('RIDE',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: textWhite)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 120),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LOG IN',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: primaryColor)),
                  Text('Access Your Account',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: textDark)),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextInput(
                      label: 'Username',
                      hint: 'Username',
                      icon: PhosphorIconsDuotone.userCircle,
                      textController: _usernameController,
                      password: false),
                  DefaultTextInput(
                      label: 'Email',
                      hint: 'Email',
                      icon: PhosphorIconsDuotone.envelopeOpen,
                      textController: _emailController,
                      password: false),
                  DefaultTextInput(
                      label: 'Password',
                      hint: 'Password',
                      icon: PhosphorIconsDuotone.lock,
                      textController: _passwordController,
                      password: true),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () async {
                      var x = await authApi.login(
                        _usernameController.text,
                        _passwordController.text,
                        _emailController.text,
                      );

                      if (x['userType'] == 'service_provider') {
                        pref.saveString('userName', x['username'].toString());
                        pref.saveString('email', x['email'].toString());
                        pref.saveString('userId', x['id'].toString());
                        pref.saveString('userType', x['userType'].toString());
                        context.go('/homePageProvider');
                      } else {
                        pref.saveString('userName', x['username'].toString());
                        pref.saveString('email', x['email'].toString());
                        pref.saveString('userId', x['id'].toString());
                        pref.saveString('userType', x['userType'].toString());
                        context.go('/homePageUser');
                      } 
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 23, 64, 136),
                              Color.fromARGB(205, 20, 54, 114),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: textWhite),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account?',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: textGrey)),
                      GestureDetector(
                        onTap: () {
                          context.push('/signUpUser');
                        },
                        child: Text(' Create one',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: primaryColor)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 0.2,
                    color: textGrey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Wanna rent your vehicle?',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: textGrey)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push('/signUpProvider');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 10, 26, 55),
                              Color.fromARGB(216, 10, 26, 55),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Center(
                        child: Text(
                          'Join Us',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: textWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
