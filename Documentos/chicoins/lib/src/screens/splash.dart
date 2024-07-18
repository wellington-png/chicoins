import 'package:chicoins/src/screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 255, 17, 0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('CHICOINS',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Color.fromARGB(255, 255, 255, 255))),
          Center(
            child: Image(
                image: AssetImage(
                    'assets/images/chico-moedas-aquariano-nato.gif')),
          ),
          Text('Quem não erra em 2023.',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)))
        ],
      ),
    ));
  }
}
