import 'package:eco_mart/presentation/elements/app_button.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/views/cart_view/widgets/cart_tile.dart';
import 'package:eco_mart/presentation/views/cart_view/widgets/payment_card.dart';
import 'package:flutter/material.dart';

import '../../../config/front_end_config.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kSecondaryColor,
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: FrontEndConfigs.kPrimaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  CustomText(
                    text: 'My Orders',
                    color: Colors.white,
                  ),
                  CustomText(text: ''),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CardTile(),
          const SizedBox(
            height: 20,
          ),
          const PaymentCard(),
          const SizedBox(
            height: 20,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Deliver to',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: 3,
                  ),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Deliver fee',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 3,
                      ),
                      CustomText(text: 'P30'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Item total',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 3,
                      ),
                      CustomText(text: 'P220'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Total',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: 3,
                      ),
                      CustomText(text: 'P220'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AppButton(onPressed: () {}, text: 'Confirm Order')
        ],
      ),
    );
  }
}
