import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/prefs_helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProviderVehiclePage extends StatefulWidget {
  const ProviderVehiclePage({super.key});

  @override
  State<ProviderVehiclePage> createState() => _ProviderVehiclePagerState();
}

class _ProviderVehiclePagerState extends State<ProviderVehiclePage> {
  final pref = getIt<PrefsHelper>();

 
  final double buttonWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff881736),
              Color(0xff2A1639),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Vehicle Details',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white, // Set the background color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                context.push('/homePageProvider');
              },
              child: Icon(Icons.home),
            ),
            ElevatedButton(
                      onPressed: () async {
                        context.push('/providerVehiclePage');
                      },
                      child: Icon(Icons.directions_car_filled),
                    ),
            ElevatedButton(
              onPressed: () async {
                context.push('/providerProfile');
              },
              child: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}


