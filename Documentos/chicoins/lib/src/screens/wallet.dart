import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chicoins/src/providers/coin_provider.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CoinProvider>(
        builder: (context, coinProvider, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: coinProvider.coins.length,
            itemBuilder: (context, index) {
              final coin = coinProvider.coins[index];
              return index != coinProvider.coins.length - 1
                  ? Card(
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: coin.isFavorite
                                    ? const Icon(Icons.star, color: Colors.yellow)
                                    : const Icon(Icons.star_border, color: Colors.grey),
                                onPressed: () {
                                  coinProvider.toggleFavorite(coin);
                                },
                                // color: coin.isFavorite ? Colors.yellow : Colors.grey,
                              ),
                            ],
                          )),
                    )
                  : Container();
            },
          );
        },
      ),
    );
  }
}
