import 'Home_Page.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHUCK NORRIS API',
      theme: ThemeData.dark(), //Usamos el tema oscuro
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'CHUCK NORRIS API'),
    );
  }
}