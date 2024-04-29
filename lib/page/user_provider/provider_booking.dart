import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/controller/controller.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/model/rental_model.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProviderBooking extends StatefulWidget {
  const ProviderBooking({super.key});

  @override
  State<ProviderBooking> createState() => _ProviderBookingState();
}

class _ProviderBookingState extends State<ProviderBooking> {
  final pref = getIt<PrefsHelper>();
  List<RentalModel> provider = [];
  final controller = getIt<Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 180,
            color: primaryColor,
            width: double.infinity,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 60, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(
                        PhosphorIconsRegular.caretLeft,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text('My Order',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [shadow]),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColorLow),
                                  child: const PhosphorIcon(
                                    PhosphorIconsRegular.shoppingCart,
                                    size: 25,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('1',
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: textDark)),
                                    Text('Current Order',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: textGrey)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColorLow),
                                  child: const PhosphorIcon(
                                    PhosphorIconsRegular.shoppingCart,
                                    size: 25,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('1',
                                        style: GoogleFonts.poppins(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: textDark)),
                                    Text('All Order',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: textGrey)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text('Transaction',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: textDark)),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [shadow]),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Honda Jazz',
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: textDark)),
                            Text('RM250',
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor)),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const PhosphorIcon(
                              PhosphorIconsDuotone.calendar,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('10 April 2024 - 11 April 2024',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: textGrey)),
                          ],
                        ),
                        Row(
                          children: [
                            const PhosphorIcon(
                              PhosphorIconsDuotone.clock,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('10:30 AM',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: textGrey)),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const PhosphorIcon(
                                  PhosphorIconsDuotone.userCircle,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text('syarulaizat',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor)),
                              ],
                            ),
                            Row(
                              children: [
                                const PhosphorIcon(
                                  PhosphorIconsDuotone.clock,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text('24 Hours',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: textGrey)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const PhosphorIcon(
                              PhosphorIconsDuotone.mapPin,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('Village 5A',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: textGrey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    )
        //  FutureBuilder(
        //     future: controller.getRentals(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(child: CircularProgressIndicator());
        //       } else if (snapshot.hasError) {
        //         // final error = snapshot.error;
        //         return const Center(child: Text('Error'));
        //       } else if (snapshot.hasData) {
        //         int x = 0;
        //         if (snapshot.data!.isEmpty) {
        //           return const Center(
        //             child: Text('No data'),
        //           );
        //         }
        //         for (var i = 0; i < snapshot.data!.length; i++) {
        //           if (snapshot.data![i].userId.toString() !=
        //               pref.readString('userId')) {
        //           } else {
        //             provider = snapshot.data!
        //                 .where(
        //                   (item) => item.userId.toString().contains(
        //                         pref.readString('userId').toLowerCase(),
        //                       ),
        //                 )
        //                 .toList();
        //           }
        //           print(provider);
        //         }
        //       }
        //       return SingleChildScrollView(
        //         child: Column(
        //           mainAxisSize: MainAxisSize.max,
        //           children: [
        //             ListView.builder(
        //                 shrinkWrap: true,
        //                 itemCount: provider.length,
        //                 itemBuilder: (context, index) {
        //                   return Container(
        //                     padding: const EdgeInsets.all(16),
        //                     child: Column(
        //                       children: [
        //                         Text(provider[index].totalCost.toString()),
        //                         Text(provider[index].startDate.toString()),
        //                         Text(provider[index].endDate.toString())
        //                       ],
        //                     ),
        //                   );
        //                 })
        //           ],
        //         ),
        //       );
        //     }),
        );
  }
}
