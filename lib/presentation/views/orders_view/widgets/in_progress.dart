import 'package:another_stepper/another_stepper.dart';
import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InProgress extends StatefulWidget {
  const InProgress({Key? key}) : super(key: key);

  @override
  State<InProgress> createState() => _InProgressState();
}

class _InProgressState extends State<InProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: CustomText(
              text: 'Tracking Order',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: CustomText(
              text: 'Order #123432322',
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnotherStepper(
            stepperList: stepperData,
            stepperDirection: Axis.horizontal,
            activeBarColor: Colors.green,
            inActiveBarColor: Colors.grey,
            activeIndex: 1,
            barThickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomText(
            text: 'Preparing Food',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            text: 'Driven At The Restaurant',
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      child: const Icon(Icons.person_outline_sharp),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'James Smith',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_border_outlined,
                                color: FrontEndConfigs.kPrimaryColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text: '4.9/5',
                                color: Colors.grey,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 45.0,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: const Icon(
                          CupertinoIcons.chat_bubble_text,
                          color: FrontEndConfigs.kPrimaryColor,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 45.0,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: const Icon(
                          CupertinoIcons.phone,
                          color: FrontEndConfigs.kPrimaryColor,
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<StepperData> stepperData = [
    StepperData(
        iconWidget: const CircleAvatar(
            backgroundColor: FrontEndConfigs.kPrimaryColor,
            child: ImageIcon(
              AssetImage(
                'assets/images/fork.png',
              ),
              color: Colors.white,
            ))),
    StepperData(
        iconWidget: const CircleAvatar(
            backgroundColor: FrontEndConfigs.kPrimaryColor,
            child: ImageIcon(
              AssetImage(
                'assets/images/delivery.png',
              ),
              color: Colors.white,
            ))),
    StepperData(
        iconWidget: const CircleAvatar(
            backgroundColor: FrontEndConfigs.kPrimaryColor,
            child: ImageIcon(
              AssetImage(
                'assets/images/red-flag.png',
              ),
              color: Colors.white,
            ))),
  ];
}
