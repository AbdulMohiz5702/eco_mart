import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/presentation/elements/app_button.dart';
import 'package:flutter/material.dart';

import '../../elements/custom_text.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: AppButton(
          onPressed: () {},
          text: 'Add Payment Method',
        ),
      ),
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
                    text: 'Payment Method',
                    color: Colors.white,
                  ),
                  CustomText(text: '')
                ],
              ),
            ),
          ),
          SizedBox(
            height: 39,
          ),
          CustomText(
            text: 'Choose another\n method ',
            fontWeight: FontWeight.w600,
            fontSize: 28,
            letterSpacing: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          _getCard('assets/images/cash-on-delivery.png', 'Cash on Delivery'),
          const SizedBox(
            height: 10,
          ),
          _getCard('assets/images/credit-cards.png', 'Gcash'),
          const SizedBox(
            height: 10,
          ),
          _getCard('assets/images/paypal.png', 'PayPal'),
        ],
      ),
    );
  }

  Widget _getCard(String image, String text) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageIcon(AssetImage(image)),
            CustomText(text: text),
            CustomText(text: ''),
          ],
        ),
      ),
    );
  }
}
