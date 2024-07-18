import 'package:chicoins/src/core/network/api_client.dart';
import 'package:chicoins/src/models/coin.dart';

class CoinRepository {
  final ApiClient apiClient;

  CoinRepository({required this.apiClient});

  Future<List<Coin>> getCoins() async {
    final response = await apiClient.get('/coins/markets?vs_currency=brl');
    return (response as List).map((coin) => Coin.fromJson(coin)).toList();
  }
}
