import 'package:flutter/material.dart';

class Congratulations extends StatefulWidget {
  const Congratulations({super.key});

  @override
  State<StatefulWidget> createState() => _Congratulations();
}

class _Congratulations extends State {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              'Congrtulations',
            ),
          ),
        ],
      ),
    );
  }
}
