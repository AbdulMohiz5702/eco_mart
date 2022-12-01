import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/views/orders_view/widgets/in_progress.dart';
import 'package:eco_mart/presentation/views/orders_view/widgets/recents.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

int selectIndex = 1;

class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/home-banner-map.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        bottomNavigationBar: selectIndex == 1
            ? const Padding(padding: EdgeInsets.all(18.0), child: InProgress())
            : const SizedBox(),
        backgroundColor: selectIndex == 1 ? Colors.transparent : Colors.white,
        body: _getUI(context),
      ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'My Orders',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectIndex = 1;
                    });
                  },
                  child: Column(
                    children: [
                      CustomText(text: 'In Progress'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                            color: selectIndex == 1
                                ? FrontEndConfigs.kPrimaryColor
                                : Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectIndex = 2;
                    });
                  },
                  child: Column(
                    children: [
                      CustomText(text: 'recent'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                            color: selectIndex == 2
                                ? FrontEndConfigs.kPrimaryColor
                                : Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (selectIndex == 2) RecentOrders()
        ],
      ),
    );
  }
}
