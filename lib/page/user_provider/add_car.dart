import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/network/api/auth_api.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:byride_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../utils.dart/text_input.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final TextEditingController brand = TextEditingController();
  final TextEditingController model = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController rental = TextEditingController();
  final TextEditingController availability = TextEditingController();
  final TextEditingController type = TextEditingController();
  final TextEditingController picture = TextEditingController();
  final TextEditingController transmission = TextEditingController();
  final TextEditingController seats = TextEditingController();
  final AuthApi authApi = getIt<AuthApi>();
  final PrefsHelper prefsHelper = getIt<PrefsHelper>();
  void clearAndNavigate(String path) {
    while (context.canPop() == true) {
      context.pop();
    }
    context.pushReplacement(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: textWhite,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      color: primaryColor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.pop();
                                },
                                icon: const PhosphorIcon(
                                  PhosphorIconsRegular.caretLeft,
                                  color: textWhite,
                                )),
                            Expanded(
                              child: Text('Edit Vehicle',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: textWhite)),
                            ),
                            Container()
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(25)),
                              child: Container(
                                  color: textGrey,
                                  width: double.infinity,
                                  height: 250,
                                  child: const Center(
                                    child: PhosphorIcon(
                                      PhosphorIconsRegular.plusCircle,
                                      size: 70,
                                      color: textDark,
                                    ),
                                  )),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: textWhite,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        topLeft: Radius.circular(25))),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Text('Add Vehicle',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: textDark)),
                              Text('Make sure all information is true',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: textGrey)),
                              SizedBox(
                                height: 8,
                              ),
                              DefaultTextInput(
                                password: false,
                                label: 'Brand',
                                icon: PhosphorIconsDuotone.carSimple,
                                textController: brand,
                              ),
                              DefaultTextInput(
                                password: false,
                                label: 'Model',
                                icon: PhosphorIconsDuotone.car,
                                textController: model,
                              ),
                              DefaultTextInput(
                                password: false,
                                label: 'Year',
                                icon: PhosphorIconsDuotone.calendar,
                                textController: year,
                              ),
                              DefaultTextInput(
                                password: false,
                                label: 'Rental Rate',
                                icon: PhosphorIconsDuotone.money,
                                textController: rental,
                              ),
                              DefaultTextInput(
                                password: false,
                                label: 'Availability',
                                icon: PhosphorIconsDuotone.caretUpDown,
                                textController: availability,
                              ),
                              DefaultTextInput(
                                password: false,
                                label: 'Type',
                                icon: PhosphorIconsDuotone.dotsThreeCircle,
                                textController: type,
                              ),
                              DefaultTextInput(
                                password: false,
                                label: 'Picture Path',
                                icon: PhosphorIconsDuotone.image,
                                textController: picture,
                              ),
                              DefaultTextInput(
                                password: false,
                                label: 'Transmission',
                                icon: PhosphorIconsDuotone.engine,
                                textController: transmission,
                              ),
                              DefaultTextInput(
                                password: false,
                                label: 'No. Seats',
                                icon: PhosphorIconsDuotone.officeChair,
                                textController: seats,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () async {
                  try {
                    await authApi
                        .addVehicle(
                            brand.text,
                            model.text,
                            int.parse(year.text),
                            rental.text,
                            int.parse(availability.text),
                            int.parse(pref.readString('userId')),
                            type.text,
                            picture.text,
                            transmission.text,
                            seats.text)
                        .then((value) {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Vehicle Succesful added',
                        onConfirmBtnTap: () {
                          context.go('/mycar');
                        },
                      );
                    });
                  } catch (e) {
                    // ignore: use_build_context_synchronously
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      text: 'Update Failed',
                      onConfirmBtnTap: () {
                        context.pop();
                      },
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
                      'Save',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: textWhite),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
