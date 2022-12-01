import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(itemBuilder: (context, i) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: _getCard(),
      );
    }));
  }

  Widget _getCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/beef.png'),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Fresh Meet',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          CustomText(
                            text: 'Order #123432322',
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Icon(
                  Icons.check_circle,
                  color: FrontEndConfigs.kPrimaryColor,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Date',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      text: '10.12.2022',
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 13,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Delivered To:',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      text: 'Home',
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 13,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: 'Order Again',
                  color: FrontEndConfigs.kPrimaryColor,
                  fontSize: 15,
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: 'Rate     ',
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
