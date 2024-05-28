import 'package:flutter/material.dart';
import 'package:mirror_wall/view/google_screen.dart';


import 'package:provider/provider.dart';

import '../provider/Google_Provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => GoogleProvider(),)
  ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Google(),
    );
  }
}