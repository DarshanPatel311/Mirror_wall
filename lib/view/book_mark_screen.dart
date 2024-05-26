import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/google_provider.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookMark'),
      ),
      body: Column(
        children: [
          ...List.generate(
              Provider.of<GoogleProvider>(context, listen: false)
                  .bookmarkList
                  .length,
                  (index) =>ListTile(
                onTap: () {
                  Provider.of<GoogleProvider>(context,listen: true).bookmarkList[index];
                  Navigator.of(context).pop();
                },
                title:Text(Provider.of<GoogleProvider>(context,listen: false).bookmarkList[index]),
                subtitle: Text(Provider.of<GoogleProvider>(context,listen: true).bookmarkList[index]),

                trailing: IconButton(onPressed: () {
                  Provider.of<GoogleProvider>(context,listen: false).remove(index);
                }, icon: Icon(Icons.cancel_rounded),),
              ) ),

        ],
      ),
    );
  }
}