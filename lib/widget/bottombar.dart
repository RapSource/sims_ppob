import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/pages/profile.dart';
import 'package:sims_ppob_adityapratama/pages/home.dart';
import 'package:sims_ppob_adityapratama/pages/topup.dart';
import 'package:sims_ppob_adityapratama/pages/transaction.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarBarState();
}

class _BottomNavBarBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    TopupPage(),
    TransactionPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money, size: 30),
              label: 'Top Up',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card, size: 30),
              label: 'Transaction'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded, size: 30),
              label: 'Akun'
            ),
          ],
          currentIndex: _selectedIndex,
          elevation: 2,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      )
    );
  }
}
