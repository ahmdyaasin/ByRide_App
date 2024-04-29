import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProviderProfilePage extends StatefulWidget {
  const ProviderProfilePage({Key? key}) : super(key: key);

  @override
  State<ProviderProfilePage> createState() => _ProviderProfilePagerState();
}

class _ProviderProfilePagerState extends State<ProviderProfilePage> {
  final pref = getIt<PrefsHelper>();

  final double buttonWidth = 200;

  @override
  Widget build(BuildContext context) {
    String name = pref.readString('userName');
    String email = pref.readString('email');
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Text('Provider Profile',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textGrey)),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [shadow]),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/icon.png'),
                    radius: 35,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textDark)),
                      Text(email,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: textGrey)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                context.push('/providerbooking');
              },
              child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [shadow]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('General',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: textGrey)),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.green.withOpacity(0.2)),
                            child: PhosphorIcon(
                              PhosphorIconsRegular.shoppingCart,
                              color: Colors.green[900]!,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('My Order',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: textDark)),
                              Text('View All Order',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: textGrey)),
                            ],
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          const PhosphorIcon(
                            PhosphorIconsRegular.caretRight,
                            color: textDark,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                pref.clearData().then((value) => context.go('/'));
              },
              child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [shadow]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Others',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: textGrey)),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: redColor.withOpacity(0.2)),
                            child: const PhosphorIcon(
                              PhosphorIconsRegular.signOut,
                              color: redColor,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sign Out',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: textDark)),
                              Text('Securely log out of Account',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: textGrey)),
                            ],
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          const PhosphorIcon(
                            PhosphorIconsRegular.caretRight,
                            color: textDark,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
