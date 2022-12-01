import 'package:eco_mart/presentation/views/stores/layout/stores_body.dart';
import 'package:flutter/material.dart';

class StoresView extends StatelessWidget {
  const StoresView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StoresBody(),
    );
  }
}
