import 'package:flutter/material.dart';
import 'wallet.dart';
import 'favorites.dart';
import 'settings.dart';
import 'swap.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> _navigationItems = [
    {'icon': Icons.wallet, 'label': 'Wallet', 'page': const WalletPage()},
    {'icon': Icons.swap_vert, 'label': 'Swap', 'page': const SwapPage()},
    {'icon': Icons.star, 'label': 'Favorites', 'page': const FavoritesPage()},
    {'icon': Icons.settings, 'label': 'Settings', 'page': const SettingsPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'CHICOINS',
        ),
        leading: Image.asset('assets/images/logo-chico-moedas.png'),
      ),
      body: _navigationItems[_selectedIndex]['page'],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _navigationItems.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> item = entry.value;
            return IconButton(
              icon: Icon(
                item['icon'],
                color: _selectedIndex == index ? Colors.white : Colors.grey,
              ),
              onPressed: () => _onItemTapped(index),
            );
          }).toList(),
        ),
      ),
    );
  }
}
