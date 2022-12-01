import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:flutter/material.dart';

class CardTile extends StatefulWidget {
  const CardTile({Key? key}) : super(key: key);

  @override
  State<CardTile> createState() => _CardTileState();
}

int value = 1;

class _CardTileState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/beef.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(text: 'Squid'),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        value--;
                        setState(() {});
                      },
                      child: const CircleAvatar(
                        radius: 14,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 18.0),
                          child: Icon(
                            Icons.minimize,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomText(text: value.toString()),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        value++;
                        setState(() {});
                      },
                      child: const CircleAvatar(
                        radius: 14,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CustomText(text: 'p20'),
          ],
        ),
      ),
    );
  }
}
