

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  static pushReplacement(BuildContext context, Widget targetClass) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1400),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secAnimation, Widget child) {
          animation = CurvedAnimation(parent: animation, curve: Curves.linear);
          return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child);
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secAnimation) {
          return targetClass;
        }));
  }

  static pushRoute(BuildContext context, Widget targetClass) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.linear);
              return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                  child: child);
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return targetClass;
            }));
  }

  static removeAllRoutes(BuildContext context, Widget targetClass) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => targetClass), (route) => false);
  }
}
