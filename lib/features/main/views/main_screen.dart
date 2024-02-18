import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [

          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            //child: ,
          )

        ],
      ),
    ));
  }
}
