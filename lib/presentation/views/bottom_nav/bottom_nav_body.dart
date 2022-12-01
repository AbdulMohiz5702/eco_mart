import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/presentation/views/orders_view/orders_view.dart';
import 'package:flutter/material.dart';
import '../home/home_view.dart';
import '../profile_view/profile_view.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeView(),
    const OrdersView(),
    const ProfileView(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: FrontEndConfigs.kPrimaryColor,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0
                  ? FrontEndConfigs.kPrimaryColor
                  : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: _currentIndex == 1
                  ? FrontEndConfigs.kPrimaryColor
                  : Colors.grey,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                color: _currentIndex == 2
                    ? FrontEndConfigs.kPrimaryColor
                    : Colors.grey,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
