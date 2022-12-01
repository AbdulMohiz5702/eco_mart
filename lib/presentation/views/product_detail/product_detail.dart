import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/elements/app_button.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/views/cart_view/cart_view.dart';
import 'package:flutter/material.dart';

import '../../elements/flush_bar.dart';

class ProductDetail extends StatefulWidget {
  String name;
  String image;
  String price;

  ProductDetail({required this.name, required this.image, required this.price});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

int index = 1;

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kSecondaryColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: AppButton(
          onPressed: () {
            getFlushBar(context, title: 'Product Successfully added to cart');
          },
          text: 'Add to Cart',
        ),
      ),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    text: 'Stores',
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      NavigationHelper.pushRoute(context, const CartView());
                    },
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset(widget.image),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: CustomText(
            text: widget.name,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          )),
          const SizedBox(
            height: 20,
          ),
          CustomText(
            text: 'Sections',
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _getCard(
                  cardImage: widget.image,
                  kg: '1/4 kg',
                  cardPrice: widget.price,
                  color:
                      index == 1 ? FrontEndConfigs.kPrimaryColor : Colors.white,
                  onPressd: () {
                    index = 1;
                    setState(() {});
                  }),
              _getCard(
                  cardImage: widget.image,
                  kg: '1/2 kg',
                  cardPrice: widget.price,
                  color:
                      index == 2 ? FrontEndConfigs.kPrimaryColor : Colors.white,
                  onPressd: () {
                    index = 2;
                    setState(() {});
                  }),
              _getCard(
                  cardImage: widget.image,
                  kg: '1 kg',
                  cardPrice: widget.price,
                  color:
                      index == 3 ? FrontEndConfigs.kPrimaryColor : Colors.white,
                  onPressd: () {
                    index = 3;
                    setState(() {});
                  })
            ],
          )
        ],
      ),
    );
  }

  Widget _getCard(
      {required String cardImage,
      required String kg,
      required String cardPrice,
      VoidCallback? onPressd,
      required Color color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          child: GestureDetector(
            onTap: onPressd,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: color),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(cardImage),
              ),
            ),
          ),
        ),
        CustomText(text: kg),
        CustomText(text: cardPrice),
      ],
    );
  }
}
