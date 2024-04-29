// ignore_for_file: unused_local_variable

import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/controller/controller.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/model/users_model.dart';
import 'package:byride_app/network/api/auth_api.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:byride_app/utils.dart/text_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage(
      {super.key,
      required this.id,
      required this.img,
      required this.brand,
      required this.model,
      required this.year,
      required this.rate,
      required this.type,
      required this.ownerId});
  final String id;
  final String ownerId;
  final String img;
  final String brand;
  final String model;
  final String year;
  final String rate;
  final String type;
  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  final pref = getIt<PrefsHelper>();
  final AuthApi authApi = getIt<AuthApi>();
  final controller = getIt<Controller>();
  List<UsersModel> provider = [];
  DateTime selectedDateStart = DateTime.now();
  TimeOfDay selectedTimeStart = TimeOfDay.now();

  DateTime selectedDateEnd = DateTime.now();
  TimeOfDay selectedTimeEnd = TimeOfDay.now();

  Future<void> _selectDateStart(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateStart,
        firstDate: DateTime(2024, 2),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateStart) {
      setState(() {
        selectedDateStart = picked;
      });
    }
  }

  Future<void> _selectDateEnd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateEnd,
        firstDate: DateTime(2024, 2),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateEnd) {
      setState(() {
        selectedDateEnd = picked;
      });
    }
  }

  Future<void> _selectTimeStart(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != selectedTimeStart) {
      setState(() {
        selectedTimeStart = picked;
      });
    }
  }

  Future<void> _selectTimeEnd(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != selectedTimeEnd) {
      setState(() {
        selectedTimeEnd = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
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
                              child: Text('Confirm Details',
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
                              child: SizedBox(
                                width: double.infinity,
                                height: 250,
                                child: Image.network(
                                  widget.img,
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${widget.brand} ${widget.model}',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: textDark)),
                                    Text(
                                      'Universiti Teknologi PETRONAS (UTP) 32610 Seri Iskandar, Perak Darul Ridzuan Malaysia.',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: textDark),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        const PhosphorIcon(
                                          PhosphorIconsFill.star,
                                          color: yellowColor,
                                          size: 20,
                                        ),
                                        Text(' 4.8',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: textDark)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text('(100 Review)',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey[600])),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text('Start Date and Time',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: textDark)),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                _selectDateStart(context),
                                            child: const Text('Select date'),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                _selectTimeStart(context),
                                            child: const Text('Select Time'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${"${selectedDateStart.toLocal()}".split(' ')[0]} ${localizations.formatTimeOfDay(selectedTimeStart, alwaysUse24HourFormat: true)}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color.fromARGB(
                                                      255, 9, 40, 66))),
                                          SizedBox(width: 5),
                                          Icon(Icons.schedule),
                                        ],
                                      ),
                                    ),

                                    // Text("${selectedDateStart.toLocal()} "
                                    //     .split(' ')[0]),
                                    // Text(localizations.formatTimeOfDay(
                                    //     selectedTimeStart,
                                    //     alwaysUse24HourFormat: true)),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text('End Date and Time',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: textDark)),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              _selectDateEnd(context);
                                              print(
                                                  "${"${selectedDateEnd.toLocal()}".split(' ')[0]} ${localizations.formatTimeOfDay(selectedTimeEnd, alwaysUse24HourFormat: true)}");
                                            },
                                            child: const Text('Select date'),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                _selectTimeEnd(context),
                                            child: const Text('Select Time'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${"${selectedDateEnd.toLocal()}".split(' ')[0]} ${localizations.formatTimeOfDay(selectedTimeEnd, alwaysUse24HourFormat: true)}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color.fromARGB(
                                                      255, 9, 40, 66))),
                                          SizedBox(width: 5),
                                          Icon(Icons.schedule),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: DefaultTextInput(
                            label: 'Pickup Location',
                            hint: 'Location',
                            password: false,
                            icon: PhosphorIconsDuotone.mapPin,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () async {
                  var x = await authApi
                      .booking(
                          pref.readString('userId'),
                          widget.id,
                          "${"${selectedDateStart.toLocal()}".split(' ')[0]} ${localizations.formatTimeOfDay(selectedTimeStart, alwaysUse24HourFormat: true)}",
                          "${"${selectedDateEnd.toLocal()}".split(' ')[0]} ${localizations.formatTimeOfDay(selectedTimeEnd, alwaysUse24HourFormat: true)}",
                          widget.rate,
                          "30",
                          )
                      .then((value) => context.push('/payment'));
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
                      'Book Now',
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
