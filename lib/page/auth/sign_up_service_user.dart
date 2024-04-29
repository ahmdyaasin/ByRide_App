// ignore_for_file: use_build_context_synchronously

import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/network/api/auth_api.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:byride_app/utils.dart/text_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SignUpUserPage extends StatelessWidget {
  const SignUpUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SignUpUserForm(),
      ),
    );
  }
}

class SignUpUserForm extends StatefulWidget {
  const SignUpUserForm({super.key});

  @override
  _SignUpUserFormState createState() => _SignUpUserFormState();
}

class _SignUpUserFormState extends State<SignUpUserForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController userType = TextEditingController();
  final authApi = getIt<AuthApi>();
  final pref = getIt<PrefsHelper>();

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
              padding: const EdgeInsets.only(top: 50.0, left: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: const PhosphorIcon(
                            PhosphorIconsRegular.caretLeft,
                            color: textWhite,
                          )),
                      SizedBox(
                        width: 12,
                      ),
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
                  Text('Sign Up',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: primaryColor)),
                  Text('Go Ride anywhere with us',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: textDark)),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextInput(
                      textController: fullName,
                      icon: PhosphorIconsDuotone.userCircle,
                      hint: 'Fullname',
                      password: false),
                  DefaultTextInput(
                      textController: _usernameController,
                      icon: PhosphorIconsDuotone.userCircle,
                      hint: 'Username',
                      password: false),
                  DefaultTextInput(
                      textController: email,
                      hint: 'Email',
                      icon: PhosphorIconsDuotone.envelope,
                      password: false),
                  DefaultTextInput(
                      textController: _passwordController,
                      hint: 'Password',
                      icon: PhosphorIconsDuotone.lock,
                      password: true),
                  const SizedBox(height: 230),
                  GestureDetector(
                    onTap: () async {
                      try {
                        await authApi.signUpUser(
                          _usernameController.text,
                          _passwordController.text,
                          email.text,
                          fullName.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Account created successfully')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Failed to create account: $e')),
                        );
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
                          'Sign Up',
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
                  const SizedBox(
                    height: 10,
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
