import 'package:byride_app/constant/constant.dart';
import 'package:byride_app/controller/controller.dart';
import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MyCar extends StatefulWidget {
  const MyCar({super.key});

  @override
  State<MyCar> createState() => _MyCarState();
}

final pref = getIt<PrefsHelper>();
final controller = getIt<Controller>();

class _MyCarState extends State<MyCar> {
  late PageController _pageController1;
  String name = pref.readString('userName');
  String id = pref.readString('userId');
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
            future: controller.getProviderCar(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // final error = snapshot.error;
                return const Center(child: Text('Error'));
              } else if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          LottieBuilder.asset(
                            'assets/lottie/car.json',
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: RefreshIndicator(
                              onRefresh: () {
                                setState(() {});
                                return controller.getProviderCar(id);
                              },
                              child: SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('No Vehicle Has been added',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: textGrey)),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        context.push("/addcar");
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(
                                                    255, 23, 64, 136),
                                                Color.fromARGB(
                                                    205, 20, 54, 114),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Add Your Ride',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: textWhite),
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
                return RefreshIndicator(
                  onRefresh: () {
                    setState(() {});
                    return controller.getProviderCar(id);
                  },
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
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
                            const SizedBox(
                              height: 60,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('List of My Vehicle',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: textWhite)),
                                      Text('Tap to edit your vehicle',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: textWhite)),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.push("/addcar");
                                    },
                                    child: const PhosphorIcon(
                                      PhosphorIconsRegular.plus,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final id = snapshot.data![index].id;
                                        final carName =
                                            snapshot.data![index].model;
                                        final carBrand =
                                            snapshot.data![index].brand;
                                        final rate =
                                            snapshot.data![index].rentalRate;
                                        final url =
                                            snapshot.data![index].picturePath;
                                        final av =
                                            snapshot.data![index].availability;
                                        final type = snapshot.data![index].type;
                                        final trans =
                                            snapshot.data![index].transmission;
                                        final seat =
                                            snapshot.data![index].numSeats;
                                        return GestureDetector(
                                          onTap: () {
                                            context.pushNamed('editCar',
                                                queryParameters: {
                                                  'id': id.toString(),
                                                  'img': url,
                                                  'brand': carBrand,
                                                  'model': carName,
                                                  'year': snapshot
                                                      .data![index].year
                                                      .toString(),
                                                  'rate': rate,
                                                  'type': type.toString(),
                                                  'ownerId': snapshot
                                                      .data![index]
                                                      .serviceProviderId
                                                      .toString(),
                                                  'seat': seat.toString(),
                                                  'trans': trans,
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
                                                          image: NetworkImage(
                                                              url!),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 5,
                                                      left: 5,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 2,
                                                                horizontal: 8),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            color:
                                                                primaryColorLow),
                                                        child: Text(
                                                            snapshot
                                                                .data![index]
                                                                .year
                                                                .toString(),
                                                            style: GoogleFonts.poppins(
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(carBrand,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      primaryColor)),
                                                      Text(carName,
                                                          style: GoogleFonts
                                                              .poppins(
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
                                                              color:
                                                                  yellowColor,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text('4.5',
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color:
                                                                        textDark)),
                                                            Text('(50 Reviews)',
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        12,
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
                                                              color:
                                                                  primaryColor,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .numSeats
                                                                    .toString(),
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        12,
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
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 4),
                                                        decoration: BoxDecoration(
                                                            color: av == 1
                                                                ? Colors
                                                                    .green[400]
                                                                : Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                        child: Row(
                                                          children: [
                                                            Text('Status: ',
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        textWhite)),
                                                            Text(
                                                                av == 1
                                                                    ? ' Available'
                                                                    : ' Not Available',
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
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
                  ),
                );
              }
              return Container();
            }));
  }
}
