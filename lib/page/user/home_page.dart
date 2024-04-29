import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/controller/controller.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePageUser extends StatefulWidget {
  const HomePageUser({super.key});

  @override
  State<HomePageUser> createState() => _HomePageUserState();
}

final pref = getIt<PrefsHelper>();
final controller = getIt<Controller>();

class _HomePageUserState extends State<HomePageUser> {
  late PageController _pageController1;
  String name = pref.readString('userName');
  int activePage = 0;
  @override
  void initState() {
    _pageController1 = PageController(initialPage: 1, viewportFraction: 0.90);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: controller.getDevices(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // final error = snapshot.error;
                return const Center(child: Text('Error'));
              } else if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No data'),
                  );
                }
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(25))),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 50, left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hi, $name',
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: textWhite)),
                                Text('Let explore your ride today with ByRide',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: textWhite)),
                                const SizedBox(
                                  height: 26,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.push('/availableVehicle');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [shadow],
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          const PhosphorIcon(
                                            PhosphorIconsRegular
                                                .magnifyingGlass,
                                            color: primaryColor,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text('Search',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: textGrey)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text('Popular',
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 280,
                                child: PageView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padEnds: true,
                                  pageSnapping: true,
                                  controller: _pageController1,
                                  onPageChanged: (page) {
                                    // setState(() {
                                    activePage = page;
                                    // });
                                  },
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6, right: 6, top: 8, bottom: 8),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.pushNamed('vdetails',
                                              queryParameters: {
                                                'id': snapshot.data![index].id
                                                    .toString(),
                                                'img': snapshot
                                                    .data![index].picturePath,
                                                'brand':
                                                    snapshot.data![index].brand,
                                                'model':
                                                    snapshot.data![index].model,
                                                'year': snapshot
                                                    .data![index].year
                                                    .toString(),
                                                'rate': snapshot
                                                    .data![index].rentalRate
                                                    .toString(),
                                                'type':
                                                    snapshot.data![index].type,
                                                'ownerId': snapshot.data![index]
                                                    .serviceProviderId
                                                    .toString()
                                              });
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 260,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [shadow],
                                                      color: textWhite,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Column(
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                                double.infinity,
                                                            height: 170,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              child:
                                                                  Image.network(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .picturePath!,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 5,
                                                            right: 5,
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          2,
                                                                      horizontal:
                                                                          8),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25),
                                                                  color:
                                                                      primaryColorLow),
                                                              child: Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .year
                                                                      .toString(),
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              primaryColor)),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 5,
                                                            right: 50,
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          2,
                                                                      horizontal:
                                                                          8),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25),
                                                                  color:
                                                                      primaryColorLow),
                                                              child: Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .transmission
                                                                      .toString(),
                                                                  style: GoogleFonts.poppins(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color:
                                                                          primaryColor)),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    '${snapshot.data![index].brand} ${snapshot.data![index].model}',
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color:
                                                                            textDark)),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        'RM ${snapshot.data![index].rentalRate}',
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color: textDark)),
                                                                    Text(
                                                                        '/Hours',
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: textGrey)),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    const PhosphorIcon(
                                                                      PhosphorIconsFill
                                                                          .star,
                                                                      color:
                                                                          yellowColor,
                                                                      size: 20,
                                                                    ),
                                                                    Text(' 4.8',
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color: textDark)),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                        '(100 Review)',
                                                                        style: GoogleFonts.poppins(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.grey[600])),
                                                                  ],
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
                                                                          BorderRadius.circular(
                                                                              30)),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          '${snapshot.data![index].numSeats}',
                                                                          style: GoogleFonts.poppins(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: textWhite)),
                                                                      Text(
                                                                          ' Seater',
                                                                          style: GoogleFonts.poppins(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: textWhite)),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Explore',
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: textDark)),
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final carName =
                                          snapshot.data![index].model;
                                      final carBrand =
                                          snapshot.data![index].brand;
                                      final rate =
                                          snapshot.data![index].rentalRate;
                                      final url =
                                          snapshot.data![index].picturePath;
                                      return GestureDetector(
                                        onTap: () {
                                          context.pushNamed('vdetails',
                                              queryParameters: {
                                                'id': snapshot.data![index].id
                                                    .toString(),
                                                'img': snapshot
                                                    .data![index].picturePath,
                                                'brand':
                                                    snapshot.data![index].brand,
                                                'model':
                                                    snapshot.data![index].model,
                                                'year': snapshot
                                                    .data![index].year
                                                    .toString(),
                                                'rate': snapshot
                                                    .data![index].rentalRate
                                                    .toString(),
                                                'type':
                                                    snapshot.data![index].type,
                                                'ownerId': snapshot.data![index]
                                                    .serviceProviderId
                                                    .toString()
                                              });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [shadow],
                                              color: Colors.white),
                                          child: Row(
                                            children: [
                                              Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: SizedBox(
                                                      height: 100,
                                                      width: 100,
                                                      child: Image(
                                                        image:
                                                            NetworkImage(url!),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 5,
                                                    left: 5,
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 2,
                                                          horizontal: 8),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                          color:
                                                              primaryColorLow),
                                                      child: Text(
                                                          snapshot
                                                              .data![index].year
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      primaryColor)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(carBrand,
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                primaryColor)),
                                                    Text(carName,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
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
                                                            size: 15,
                                                            color: yellowColor,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text('4.5',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      textDark)),
                                                          Text('(50 Reviews)',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      textGrey)),
                                                          const VerticalDivider(),
                                                          const PhosphorIcon(
                                                            PhosphorIconsFill
                                                                .person,
                                                            size: 15,
                                                            color: primaryColor,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                              snapshot
                                                                  .data![index]
                                                                  .numSeats
                                                                  .toString(),
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      textDark))
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16,
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                      child: Row(
                                                        children: [
                                                          Text('RM$rate',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      textWhite)),
                                                          Text('/Hours',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      textWhite)),
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
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
              return Container();
            }));
  }
}
