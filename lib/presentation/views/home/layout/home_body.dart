import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/elements/app_button.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/elements/custom_text_field.dart';
import 'package:eco_mart/presentation/views/home/layout/widgets/home_card.dart';
import 'package:eco_mart/presentation/views/stores/stores_view.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width,
                  color: FrontEndConfigs.kSecondaryColor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset('assets/images/splash.png'),
                      CustomText(
                        text: 'ECOMART',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: 4,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: 'Sustainable Market Place',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 228.0, left: 20, right: 20),
                  child: GestureDetector(
                    onTap: (){
                      NavigationHelper.pushRoute(context, StoresView());
                    },
                    child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(top:12.0,left: 12),
                            child: CustomText( text: 'Search..',),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          _homeBody(context),
        ],
      ),
    );
  }

  Widget _homeBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: HomeCard(
                image: 'assets/images/meat.png',
                text: 'Meat',
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: HomeCard(
                image: 'assets/images/fruits.png',
                text: 'Fruits',
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: HomeCard(
                image: 'assets/images/vegies.png',
                text: 'Vegitables',
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: HomeCard(
                image: 'assets/images/seafood.png',
                text: 'Fish',
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: HomeCard(
                image: 'assets/images/rice.png',
                text: 'Rice',
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: HomeCard(
                image: 'assets/images/condiments.png',
                text: 'Condiments',
              )),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          AppButton(
              onPressed: () {
                NavigationHelper.pushRoute(context, StoresView());
              },
              text: 'Store / Market'),
        ],
      ),
    );
  }
}
