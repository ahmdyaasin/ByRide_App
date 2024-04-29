import 'package:byride_app/utils.dart/utils.dart';
import 'package:flutter/material.dart';

class CarsOverviewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'ByRide',
          style: SubHeading),
      ),
      body: ListView(
        children: [
          Text(
            'Available Vehicle',
            style: MainHeading,
          )
        ],
      ),
    );
  }
}