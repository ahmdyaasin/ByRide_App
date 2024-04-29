import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/page/auth/login_page.dart';
import 'package:byride_app/page/auth/sign_up_service_provider.dart';
import 'package:byride_app/page/auth/sign_up_service_user.dart';
import 'package:byride_app/page/auth/splash.dart';
import 'package:byride_app/page/navigator_shell_provider.dart';
import 'package:byride_app/page/navigator_shell_user.dart';
import 'package:byride_app/page/other_page/available.dart';
import 'package:byride_app/page/other_page/booking_page.dart';
import 'package:byride_app/page/other_page/payment.dart';
import 'package:byride_app/page/other_page/profile_page_provider.dart';
import 'package:byride_app/page/other_page/profile_page_user.dart';
import 'package:byride_app/page/other_page/provider_vehicle.dart';
import 'package:byride_app/page/other_page/vehicle_detail_page.dart';
import 'package:byride_app/page/other_page/vehicle_detail_provider.dart';
import 'package:byride_app/page/user/edit_profile_detail.dart';
import 'package:byride_app/page/user/home_page.dart';
import 'package:byride_app/page/user/user_booking.dart';
import 'package:byride_app/page/user_provider/add_car.dart';
import 'package:byride_app/page/user_provider/edit_car.dart';
import 'package:byride_app/page/user_provider/home_page_provider.dart';
import 'package:byride_app/page/user_provider/my_car.dart';
import 'package:byride_app/page/user_provider/provider_booking.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _shellNavigatorInboxKey =
    GlobalKey<NavigatorState>(debugLabel: 'available');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'Profile');

final _shellNavigatorHomeProviderKey =
    GlobalKey<NavigatorState>(debugLabel: 'HomeProvider');
final _shellNavigatorMyCarProviderKey =
    GlobalKey<NavigatorState>(debugLabel: 'MyCar');
final _shellNavigatorUserProviderKey =
    GlobalKey<NavigatorState>(debugLabel: 'ProfileProvider');
final pref = getIt<PrefsHelper>();
String userId = pref.readString('userId');
String userType = pref.readString('userType');
final router = GoRouter(
    initialLocation: userId != ''
        ? userType == "service_user"
            ? '/homePageUser'
            : '/homePageProvider'
        : '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
          name: 'first',
          path: '/splash',
          builder: (context, state) => const SplashPage()),
      GoRoute(
          name: 'start', path: '/', builder: (context, state) => LoginPage()),
      // GoRoute(
      //     name: 'login',
      //     path: '/login',
      //     builder: (context, state) => LoginPage()),
      GoRoute(
          name: 'signUpUser',
          path: '/signUpUser',
          builder: (context, state) => SignUpUserPage()),
      GoRoute(
          name: 'signUpProvider',
          path: '/signUpProvider',
          builder: (context, state) => SignUpProviderPage()),
      // GoRoute(
      //     name: 'homePageProvider',
      //     path: '/homePageProvider',
      //     builder: (context, state) => const HomePageProvider()),
      GoRoute(
          name: 'providerProfile',
          path: '/providerProfile',
          builder: (context, state) => const ProviderProfilePage()),
      GoRoute(
          name: 'providerVehiclePage',
          path: '/providerVehiclePage',
          builder: (context, state) => const ProviderVehiclePage()),
      GoRoute(
          name: 'booking',
          path: '/booking',
          builder: (context, state) => const UserBooking()),
      GoRoute(
          name: 'payment',
          path: '/payment',
          builder: (context, state) => const PaymentPage()),
      GoRoute(
          name: 'addcar',
          path: '/addcar',
          builder: (context, state) => const AddCar()),
      GoRoute(
          name: 'providerbooking',
          path: '/providerbooking',
          builder: (context, state) => const ProviderBooking()),
      GoRoute(
        name: 'vdetails',
        path: '/vdetails',
        builder: (context, state) {
          final ownerId = state.uri.queryParameters['ownerId']!.toString();
          final img = state.uri.queryParameters['img']!;
          final brand = state.uri.queryParameters['brand']!;
          final model = state.uri.queryParameters['model']!;
          final year = state.uri.queryParameters['year']!;
          final rate = state.uri.queryParameters['rate']!;
          final type = state.uri.queryParameters['type']!;
          final id = state.uri.queryParameters['id']!;
          return VehicleDetailPage(
            id: id,
            img: img,
            brand: brand,
            model: model,
            year: year,
            rate: rate,
            type: type,
            ownerId: ownerId,
          );
        },
      ),
      GoRoute(
        name: 'vdetailsProvider',
        path: '/vdetailsProvider',
        builder: (context, state) {
          final ownerId = state.uri.queryParameters['ownerId']!.toString();
          final img = state.uri.queryParameters['img']!;
          final brand = state.uri.queryParameters['brand']!;
          final model = state.uri.queryParameters['model']!;
          final year = state.uri.queryParameters['year']!;
          final rate = state.uri.queryParameters['rate']!;
          final type = state.uri.queryParameters['type']!;
          final id = state.uri.queryParameters['id']!;
          return VehicleDetailProvider(
            id: id,
            img: img,
            brand: brand,
            model: model,
            year: year,
            rate: rate,
            type: type,
            ownerId: ownerId,
          );
        },
      ),
      GoRoute(
        name: 'editCar',
        path: '/editCar',
        builder: (context, state) {
          final ownerId = state.uri.queryParameters['ownerId']!.toString();
          final img = state.uri.queryParameters['img']!;
          final brand = state.uri.queryParameters['brand']!;
          final model = state.uri.queryParameters['model']!;
          final year = state.uri.queryParameters['year']!;
          final rate = state.uri.queryParameters['rate']!;
          final type = state.uri.queryParameters['type']!;
          final id = state.uri.queryParameters['id']!;
          final seat = state.uri.queryParameters['seat']!;
          final trans = state.uri.queryParameters['trans']!;
          return EditCar(
            id: id,
            img: img,
            brand: brand,
            model: model,
            year: year,
            rate: rate,
            type: type,
            ownerId: ownerId,
            seat: seat,
            trans: trans,
          );
        },
      ),
      GoRoute(
        name: 'editProfileDetail',
        path: '/editProfileDetail',
        builder: (context, state) {
          final img = state.uri.queryParameters['img']!;
          final email = state.uri.queryParameters['email']!;
          final fullname = state.uri.queryParameters['fullname']!;
          final username = state.uri.queryParameters['username']!;
          final id = state.uri.queryParameters['id']!;
          return EditProfileDetail(
            id: id,
            img: img,
            fullname: fullname,
            email: email,
            username: username,
          );
        },
      ),
      GoRoute(
        name: 'vBooking',
        path: '/vBooking',
        builder: (context, state) {
          final ownerId = state.uri.queryParameters['ownerId']!.toString();
          final img = state.uri.queryParameters['img']!;
          final brand = state.uri.queryParameters['brand']!;
          final model = state.uri.queryParameters['model']!;
          final year = state.uri.queryParameters['year']!;
          final rate = state.uri.queryParameters['rate']!;
          final type = state.uri.queryParameters['type']!;
          final id = state.uri.queryParameters['id']!;
          return BookingDetailsPage(
            id: id,
            img: img,
            brand: brand,
            model: model,
            year: year,
            rate: rate,
            type: type,
            ownerId: ownerId,
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return NavigationShellUser(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                name: 'homePageUser',
                path: '/homePageUser',
                pageBuilder: (context, state) => MaterialPage<void>(
                    key: ValueKey<String>(state.uri.toString() +
                        DateTime.now().millisecondsSinceEpoch.toString()),
                    child: const HomePageUser()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorInboxKey,
            routes: [
              GoRoute(
                name: 'availableVehicle',
                path: '/availableVehicle',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: AvailableVehiclePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                name: 'userProfile',
                path: '/userProfile',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: UserProfilePage(),
                ),
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return NavigationShellProvider(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeProviderKey,
            routes: [
              GoRoute(
                name: 'homePageProvider',
                path: '/homePageProvider',
                pageBuilder: (context, state) => MaterialPage<void>(
                    key: ValueKey<String>(state.uri.toString() +
                        DateTime.now().millisecondsSinceEpoch.toString()),
                    child: const HomePageProvider()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMyCarProviderKey,
            routes: [
              GoRoute(
                name: 'mycar',
                path: '/mycar',
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: ValueKey<String>(state.uri.toString() +
                      DateTime.now().millisecondsSinceEpoch.toString()),
                  child: const MyCar(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorUserProviderKey,
            routes: [
              GoRoute(
                name: 'userprovider',
                path: '/userprovider',
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: ValueKey<String>(state.uri.toString() +
                      DateTime.now().millisecondsSinceEpoch.toString()),
                  child: const ProviderProfilePage(),
                ),
              ),
            ],
          ),
        ],
      ),
    ]);
