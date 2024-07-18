import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chicoins/src/core/theme.dart';
import 'package:chicoins/src/screens/splash.dart';
import 'package:chicoins/src/core/network/api_client.dart';
import 'package:chicoins/src/repositories/coin_repository.dart';
import 'package:chicoins/src/providers/coin_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(baseUrl: 'https://api.coingecko.com/api/v3');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CoinProvider(
            coinRepository: CoinRepository(apiClient: apiClient),
          )..fetchCoins(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const SplashScreens(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
