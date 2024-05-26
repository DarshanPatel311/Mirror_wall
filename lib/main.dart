
import 'package:flutter/material.dart';
import 'package:mirror_wall/provider/google_provider.dart';
import 'package:mirror_wall/view/book_mark_screen.dart';
import 'package:mirror_wall/view/google_page.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
      MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => GoogleProvider(),),

      ] ,child: MyApp(),));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Googlepage(),
        '/Book':(context) => BookMarkScreen()
      },
    );
  }
}

