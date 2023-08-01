import 'package:flutter/material.dart';
import 'drawer.dart';

class LogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokemongGo'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/bg.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/homepage');
              },
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('assets/GrassType.png'),
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}