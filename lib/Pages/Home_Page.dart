
import 'package:flutter/material.dart';
import '../Widgets/Swiper_Chuck.dart';




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Swiper_Personalizado() // llamo al Swiper_Personalizado
        ],

      ),

      );
  }
}
