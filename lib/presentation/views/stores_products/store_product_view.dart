import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/views/product_detail/product_detail.dart';
import 'package:eco_mart/presentation/views/stores/layout/widgets/product_card.dart';
import 'package:eco_mart/utils/utils.dart';
import 'package:flutter/material.dart';

class StoresProductView extends StatelessWidget {
  String image;
  String text;

  StoresProductView({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kSecondaryColor,
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            child: Stack(
              children: [
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: FrontEndConfigs.kSecondaryColor,
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.fitWidth)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.7),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 188.0, left: 20, right: 20),
                  child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: FrontEndConfigs.kPrimaryColor,
                        ),
                        child: Center(
                            child: CustomText(
                          text: text,
                          color: Colors.white,
                        )),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 6 / 7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: AppUtils.productList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          NavigationHelper.pushRoute(
                              context,
                              ProductDetail(
                                name: AppUtils.productList[index].title.toString(),
                                image: AppUtils.productList[index].image.toString(),
                                price: AppUtils.productList[index].price.toString(),
                              ));
                        },
                        child: ProductCard(
                          image: AppUtils.productList[index].image.toString(),
                          title: AppUtils.productList[index].title.toString(),
                          prize: AppUtils.productList[index].price.toString(),
                        ),
                      );
                    }),
              ))
        ],
      ),
    );
  }
}
