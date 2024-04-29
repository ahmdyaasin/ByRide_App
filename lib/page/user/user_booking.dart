import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/controller/controller.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/model/rental_model.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserBooking extends StatefulWidget {
  const UserBooking({super.key});

  @override
  State<UserBooking> createState() => _UserBookingState();
}

class _UserBookingState extends State<UserBooking> {
  final pref = getIt<PrefsHelper>();
  List<RentalModel> provider = [];
  final controller = getIt<Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: controller.getRentals(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // final error = snapshot.error;
              return const Center(child: Text('Error'));
            } else if (snapshot.hasData) {
              int x = 0;
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No data'),
                );
              }

              for (var i = 0; i < snapshot.data!.length; i++) {
                if (snapshot.data![i].userId.toString() !=
                    pref.readString('userId')) {
                } else {
                  provider = snapshot.data!
                      .where(
                        (item) => item.userId.toString().contains(
                              pref.readString('userId').toLowerCase(),
                            ),
                      )
                      .toList();
                }
                print(provider);
              }
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.length,
                      itemBuilder: (context, index) {
                        return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [shadow]),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
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
                            Text(provider[index].startDate.toLocal().toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: textGrey)),
                          ],
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
                            Text(provider[index].endDate.toLocal().toString(),
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
                                  PhosphorIconsDuotone.money,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text("Rm${provider[index].totalCost}",
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
                                Text("${provider[index].rentalTime} Hours",
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
                            Text('Village 4C',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: textGrey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
                      })
                ],
              ),
            );
          }),
    );
  }
}
