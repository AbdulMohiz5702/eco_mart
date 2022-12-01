import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/elements/custom_text_field.dart';
import 'package:eco_mart/presentation/views/stores/layout/widgets/stores_card.dart';
import 'package:eco_mart/presentation/views/stores_products/store_product_view.dart';
import 'package:eco_mart/utils/utils.dart';
import 'package:flutter/material.dart';

class StoresBody extends StatelessWidget {
  const StoresBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: FrontEndConfigs.kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      text: 'Stores',
                      color: Colors.white,
                    ),
                    CustomText(text: ''),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              text: 'Search...',
              fillColor: FrontEndConfigs.kPrimaryColor,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: AppUtils.list.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        NavigationHelper.pushRoute(
                            context,
                            StoresProductView(
                              image: AppUtils.list[i].image.toString(),
                              text: AppUtils.list[i].text.toString(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StoreCards(
                          image: AppUtils.list[i].image.toString(),
                          name: AppUtils.list[i].text.toString(),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
