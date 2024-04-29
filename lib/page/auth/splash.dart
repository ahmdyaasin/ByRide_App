import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff881736),
          Color(0xff2A1639),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Image(
                image: AssetImage('assets/logo.png'),
                width: 250.0,
                height: 100.0,
              ),
            ),
            SizedBox(
             // height: 30,
            ),
            Text(
              'Seamless Rides, Unmatched Experiences',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 400,),
            ElevatedButton(
              onPressed: () {
                context.push('/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.white),
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
                  child: Text(
                    'GET STARTED',
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
