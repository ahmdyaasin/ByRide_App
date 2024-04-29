import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/controller/controller.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/model/users_model.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VehicleDetailProvider extends StatefulWidget {
  const VehicleDetailProvider(
      {super.key,
      required this.img,
      required this.id,
      required this.brand,
      required this.model,
      required this.year,
      required this.rate,
      required this.type,
      required this.ownerId});
  final String ownerId;
  final String id;
  final String img;
  final String brand;
  final String model;
  final String year;
  final String rate;
  final String type;

  @override
  State<VehicleDetailProvider> createState() => _VehicleDetailProviderState();
}

class _VehicleDetailProviderState extends State<VehicleDetailProvider> {
  final pref = getIt<PrefsHelper>();
  final controller = getIt<Controller>();
  List<UsersModel> provider = [];
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
                              child: Text('Vehicle Details',
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 100,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: textGrey),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const PhosphorIcon(
                                      PhosphorIconsDuotone.money,
                                      color: primaryColor,
                                      size: 35,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(widget.rate,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor)),
                                    Text('Rate/Hours',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: textGrey)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 100,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: textGrey),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const PhosphorIcon(
                                      PhosphorIconsDuotone.clock,
                                      color: primaryColor,
                                      size: 35,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(widget.year,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor)),
                                    Text('Year',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: textGrey)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 140,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: textGrey),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const PhosphorIcon(
                                      PhosphorIconsDuotone.car,
                                      color: primaryColor,
                                      size: 35,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(widget.type,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor)),
                                    Text('Type',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: textGrey)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(widget.id == "1"? "assets/images/Nasri.jpeg":'assets/images/alif.jpg'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.id == "1"? "Nasri":'Izan', 
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: textDark),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    widget.id == "1"? "Nasri@gmail.com":'Izan@gmail.com',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: textDark),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        // FutureBuilder(
                        //     future: controller.getUsers(),
                        //     builder: (context, snapshot) {
                        //       if (snapshot.connectionState ==
                        //           ConnectionState.waiting) {
                        //         return const Center(
                        //             child: CircularProgressIndicator());
                        //       } else if (snapshot.hasError) {
                        //         // final error = snapshot.error;
                        //         return const Center(child: Text('Error'));
                        //       } else if (snapshot.hasData) {
                        //         for (var i = 0;
                        //             i < snapshot.data!.length;
                        //             i++) {
                        //           if (snapshot.data![i].id.toString() !=
                        //               widget.ownerId) {
                        //           } else {
                        //             provider = snapshot.data!
                        //                 .where(
                        //                   (item) => item.id.toString().contains(
                        //                         widget.ownerId.toLowerCase(),
                        //                       ),
                        //                 ).toList();
                        //           }
                        //           print('hahahahhaha' + widget.ownerId);
                        //           print(snapshot.data![i].id.toString());
                        //         }
                        //         if (snapshot.data!.isEmpty) {
                        //           return const Center(
                        //             child: Text('No data'),
                        //           );
                        //         }
                        //       }
                        //       return ListView.builder(
                        //           padding: EdgeInsets.zero,
                        //           shrinkWrap: true,
                        //           itemCount: provider.length,
                        //           itemBuilder: (context, index) {
                        //             return Container(
                        //               padding: const EdgeInsets.all(16),
                        //               child: Row(
                        //                 children: [
                        //                   CircleAvatar(
                        //                     radius: 25,
                        //                     backgroundImage: NetworkImage(
                        //                         'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        //                   ),
                        //                   SizedBox(
                        //                     width: 8,
                        //                   ),
                        //                   Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: [
                        //                       Text(
                        //                         provider[index].username,
                        //                         style: GoogleFonts.poppins(
                        //                             fontSize: 16,
                        //                             fontWeight: FontWeight.w600,
                        //                             color: textDark),
                        //                         overflow: TextOverflow.ellipsis,
                        //                       ),
                        //                       Text(
                        //                         provider[index].email,
                        //                         style: GoogleFonts.poppins(
                        //                             fontSize: 12,
                        //                             fontWeight: FontWeight.w400,
                        //                             color: textDark),
                        //                         overflow: TextOverflow.ellipsis,
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ],
                        //               ),
                        //             );
                        //           });
                        //     })
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
