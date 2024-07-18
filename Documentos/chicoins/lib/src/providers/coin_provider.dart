import 'package:flutter/material.dart';
import 'package:chicoins/src/models/coin.dart';
import 'package:chicoins/src/repositories/coin_repository.dart';

class CoinProvider with ChangeNotifier {
  final CoinRepository coinRepository;

  List<Coin> _coins = [];
  List<Coin> get coins => _coins;

  CoinProvider({required this.coinRepository});

  Future<void> fetchCoins() async {
    _coins = await coinRepository.getCoins();
    notifyListeners();
  }

  void toggleFavorite(Coin coin) {
    final index = _coins.indexOf(coin);
    _coins[index] = _coins[index].copyWith(isFavorite: !_coins[index].isFavorite);
    notifyListeners();
  }
}
