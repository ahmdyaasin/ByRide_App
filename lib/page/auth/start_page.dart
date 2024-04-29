import 'package:byride_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: primaryColor),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                const Positioned(
                  bottom: 1,
                  left: 0,
                  right: 0,
                  child: Text(
                    'Seamless Rides, Unmatched Experiences',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: textWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push('/login');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: primaryColor),
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
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.push('/signUpUser');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(50)),
                                    color: textWhite),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const PhosphorIcon(
                                        PhosphorIconsDuotone.userCircle,
                                        color: primaryColor,
                                        size: 35,
                                      ),
                                      const SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Sing Up',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: primaryColor),
                                          ),
                                          Text(
                                            'as new user',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: primaryColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                         
                        ],
                      ),
                      GestureDetector(
                              onTap: () {
                                context.push('/signUpUser');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(50)),
                                    color: textWhite),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const PhosphorIcon(
                                        PhosphorIconsDuotone.userCircle,
                                        color: primaryColor,
                                        size: 35,
                                      ),
                                      const SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Sing Up (as vehicle provider)',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: primaryColor),
                                          ),
                                          
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.push('/signUpProvider');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Colors.white),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            height: 50,
                            width: 320,
                            alignment: Alignment.center,
                            child: const Text(
                              'SIGN UP (as vehicle provider)',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//class _StartPageState extends State<StartPage> {
 // @override
 // Widget build(BuildContext context) {
 //   return  Scaffold(
 //     appBar: AppBar(
 //       title: Text('Start Page'),
 //     ),
 //     body: Center(
 //       child: Column(
 //         mainAxisAlignment: MainAxisAlignment.center,
 //         children: [
  //          ElevatedButton(
  //            onPressed: () {
  //              context.push('/login');
 //             },
 //             child: Text('Login'),
 //           ),
 //           SizedBox(height: 20),
 //           ElevatedButton(
  //            onPressed: () {
 //               context.push('/signUpUser');
 //             },
 //             child: Text('Create Account (Service User)'),
 //           ),
 //           SizedBox(height: 20),
 //           ElevatedButton(
 //             onPressed: () {
 //               context.push( '/signUpProvider');
 //             },
 //             child: Text('Create Account (Service Provider)'),
 //           ),
 //         ],
//        ),
 //     ),
///    );
//  }
//}
