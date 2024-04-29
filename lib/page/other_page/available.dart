import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/controller/controller.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/model/vehicle_model.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:byride_app/utils.dart/text_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AvailableVehiclePage extends StatefulWidget {
  const AvailableVehiclePage({super.key});

  @override
  State<AvailableVehiclePage> createState() => _AvailableVehiclePagerState();
}

class _AvailableVehiclePagerState extends State<AvailableVehiclePage> {
  final pref = getIt<PrefsHelper>();
  final controller = getIt<Controller>();
  final double buttonWidth = 200;
  String _query = '';
  List<VehicleModel> filteredItems = [];
  List<VehicleModel> data = [];
  void search(String query) {
    setState(
      () {
        _query = query;
        filteredItems = data
            .where(
              (item) => item.model.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
        print(filteredItems);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Text('Search',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: textWhite)),
              Text('For Available Vehicle',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: textWhite)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: DefaultTextInput(
                  onchange: search,
                  password: false,
                  hint: 'Search for vehicle',
                  icon: PhosphorIconsRegular.magnifyingGlass,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                          color: primaryColorLow.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primaryColor)),
                      child: Row(
                        children: [
                          Text('Filter',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor)),
                          const PhosphorIcon(
                            PhosphorIconsRegular.caretDown,
                            color: primaryColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                          color: primaryColorLow.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primaryColor)),
                      child: Row(
                        children: [
                          Text('Price',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor)),
                          const PhosphorIcon(
                            PhosphorIconsRegular.caretDown,
                            color: primaryColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                          color: primaryColorLow.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primaryColor)),
                      child: Row(
                        children: [
                          Text('Trasmission Type',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor)),
                          const PhosphorIcon(
                            PhosphorIconsRegular.caretDown,
                            color: primaryColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                          color: primaryColorLow.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primaryColor)),
                      child: Row(
                        children: [
                          Text('Brand',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor)),
                          const PhosphorIcon(
                            PhosphorIconsRegular.caretDown,
                            color: primaryColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    )
                  ],
                ),
              ),
              FutureBuilder(
                  future: controller.getDevices(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // final error = snapshot.error;
                      return const Center(child: Text('Error'));
                    } else if (snapshot.hasData) {
                      data = snapshot.data!;
                      if (snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('No data'),
                        );
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                data.length == 0
                                    ? const Text('No data ')
                                    : filteredItems.isNotEmpty ||
                                            _query.isNotEmpty
                                        ? filteredItems.isEmpty
                                            ? Center(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'No Results Found',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 24,
                                                              color: Colors
                                                                  .black54),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Column(
                                                children: [
                                                  ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          filteredItems.length,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        final carName =
                                                            filteredItems[index]
                                                                .model;
                                                        final carBrand =
                                                            filteredItems[index]
                                                                .brand;
                                                        final rate =
                                                            filteredItems[index]
                                                                .rentalRate;
                                                        final url =
                                                            filteredItems[index]
                                                                .picturePath;
                                                        return GestureDetector(
                                                          onTap: () {
                                                            context.pushNamed(
                                                                'vdetails',
                                                                queryParameters: {
                                                                  'id': filteredItems[
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  'img': filteredItems[
                                                                          index]
                                                                      .picturePath,
                                                                  'brand': filteredItems[
                                                                          index]
                                                                      .brand,
                                                                  'model': filteredItems[
                                                                          index]
                                                                      .model,
                                                                  'year': filteredItems[
                                                                          index]
                                                                      .year
                                                                      .toString(),
                                                                  'rate': filteredItems[
                                                                          index]
                                                                      .rentalRate
                                                                      .toString(),
                                                                  'type': filteredItems[
                                                                          index]
                                                                      .type.toString(),
                                                                  'ownerId': filteredItems[
                                                                          index]
                                                                      .serviceProviderId.toString()
                                                                });
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        8),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                boxShadow: [
                                                                  shadow
                                                                ],
                                                                color: Colors
                                                                    .white),
                                                            child: Row(
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            100,
                                                                        width:
                                                                            100,
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              NetworkImage(url!),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Positioned(
                                                                      top: 5,
                                                                      left: 5,
                                                                      child:
                                                                          Container(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            vertical:
                                                                                2,
                                                                            horizontal:
                                                                                8),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(25),
                                                                            color: primaryColorLow),
                                                                        child: Text(
                                                                            filteredItems[index]
                                                                                .year
                                                                                .toString(),
                                                                            style: GoogleFonts.poppins(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: primaryColor)),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          carBrand,
                                                                          style: GoogleFonts.poppins(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: primaryColor)),
                                                                      Text(
                                                                          carName,
                                                                          style: GoogleFonts.poppins(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: textDark)),
                                                                      const SizedBox(
                                                                        height:
                                                                            8,
                                                                      ),
                                                                      IntrinsicHeight(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            const PhosphorIcon(
                                                                              PhosphorIconsFill.star,
                                                                              size: 15,
                                                                              color: yellowColor,
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Text('4.5',
                                                                                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: textDark)),
                                                                            Text('(50 Reviews)',
                                                                                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: textGrey)),
                                                                            const VerticalDivider(),
                                                                            const PhosphorIcon(
                                                                              PhosphorIconsFill.person,
                                                                              size: 15,
                                                                              color: primaryColor,
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Text(filteredItems[index].numSeats.toString(),
                                                                                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: textDark))
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            8,
                                                                      ),
                                                                      Container(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                16,
                                                                            vertical:
                                                                                4),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                primaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30)),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text('RM$rate',
                                                                                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: textWhite)),
                                                                            Text('/Hours',
                                                                                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: textWhite)),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                  filteredItems.length !=
                                                          data.length
                                                      ? Text(
                                                          filteredItems.length
                                                                  .toString() +
                                                              ' Result found.',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black54),
                                                        )
                                                      : Container()
                                                ],
                                              )
                                        : Column(
                                            children: [
                                              ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      snapshot.data!.length,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    final carName = snapshot
                                                        .data![index].model;
                                                    final carBrand = snapshot
                                                        .data![index].brand;
                                                    final rate = snapshot
                                                        .data![index]
                                                        .rentalRate;
                                                    final url = snapshot
                                                        .data![index]
                                                        .picturePath;
                                                    return GestureDetector(
                                                      onTap: () {
                                                        context.pushNamed(
                                                            'vdetails',
                                                            queryParameters: {
                                                              'id': snapshot
                                                                  .data![index]
                                                                  .id
                                                                  .toString(),
                                                              'img': snapshot
                                                                  .data![index]
                                                                  .picturePath,
                                                              'brand': snapshot
                                                                  .data![index]
                                                                  .brand,
                                                              'model': snapshot
                                                                  .data![index]
                                                                  .model,
                                                              'year': snapshot
                                                                  .data![index]
                                                                  .year
                                                                  .toString(),
                                                              'rate': snapshot
                                                                  .data![index]
                                                                  .rentalRate
                                                                  .toString(),
                                                              'type': snapshot
                                                                  .data![index]
                                                                  .type.toString(),
                                                              'ownerId': snapshot
                                                                  .data![index]
                                                                  .serviceProviderId.toString()
                                                            });
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            vertical: 8),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            boxShadow: [shadow],
                                                            color:
                                                                Colors.white),
                                                        child: Row(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  child:
                                                                      SizedBox(
                                                                    height: 100,
                                                                    width: 100,
                                                                    child:
                                                                        Image(
                                                                      image: NetworkImage(
                                                                          url!),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  top: 5,
                                                                  left: 5,
                                                                  child:
                                                                      Container(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            2,
                                                                        horizontal:
                                                                            8),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                25),
                                                                        color:
                                                                            primaryColorLow),
                                                                    child: Text(
                                                                        snapshot
                                                                            .data![
                                                                                index]
                                                                            .year
                                                                            .toString(),
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color: primaryColor)),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(carBrand,
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              primaryColor)),
                                                                  Text(carName,
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              textDark)),
                                                                  const SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  IntrinsicHeight(
                                                                    child: Row(
                                                                      children: [
                                                                        const PhosphorIcon(
                                                                          PhosphorIconsFill
                                                                              .star,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              yellowColor,
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                            '4.5',
                                                                            style: GoogleFonts.poppins(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: textDark)),
                                                                        Text(
                                                                            '(50 Reviews)',
                                                                            style: GoogleFonts.poppins(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: textGrey)),
                                                                        const VerticalDivider(),
                                                                        const PhosphorIcon(
                                                                          PhosphorIconsFill
                                                                              .person,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              primaryColor,
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                            snapshot.data![index].numSeats
                                                                                .toString(),
                                                                            style: GoogleFonts.poppins(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: textDark))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Container(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            16,
                                                                        vertical:
                                                                            4),
                                                                    decoration: BoxDecoration(
                                                                        color:
                                                                            primaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30)),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                            'RM$rate',
                                                                            style: GoogleFonts.poppins(
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: textWhite)),
                                                                        Text(
                                                                            '/Hours',
                                                                            style: GoogleFonts.poppins(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: textWhite)),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  })
                                            ],
                                          ),
                                const SizedBox(
                                  height: 100,
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  })
            ],
          )
        ],
      ),
    ));
  }
}
