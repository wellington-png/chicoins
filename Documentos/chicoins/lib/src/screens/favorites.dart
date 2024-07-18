import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chicoins/src/providers/coin_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CoinProvider>(
        builder: (context, coinProvider, child) {
          final favoriteCoins = coinProvider.coins.where((coin) => coin.isFavorite).toList();
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favoriteCoins.length,
            itemBuilder: (context, index) {
              final coin = favoriteCoins[index];
              return index != favoriteCoins.length - 1 ? Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(coin.image),
                  ),
                  title: Text(
                    coin.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(coin.symbol.toUpperCase()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'R\$ ${coin.currentPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: coin.isFavorite ? const Icon(Icons.star) : const Icon(Icons.star_border),
                        onPressed: () {
                          coinProvider.toggleFavorite(coin);
                        },
                        // color: coin.isFavorite ? Colors.yellow : Colors.grey,
                      ),
                    ],
                  ),
                ),
              ) : Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(coin.image),
                    ),
                    title: Text(
                      coin.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(coin.symbol.toUpperCase()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'R\$ ${coin.currentPrice.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: coin.isFavorite ? const Icon(Icons.star) : const Icon(Icons.star_border),
                          onPressed: () {
                            coinProvider.toggleFavorite(coin);
                          },
                          // color: coin.isFavorite ? Colors.yellow : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
