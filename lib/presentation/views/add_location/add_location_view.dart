import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/presentation/views/add_location/layout/add_location_body.dart';
import 'package:flutter/material.dart';

class AddLocationView extends StatelessWidget {
  const AddLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: FrontEndConfigs.kSecondaryColor,
      body: AddLocationBody(),
    );
  }
}
