import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/Google_Provider.dart';

InkWell History(BuildContext context) {
  return InkWell(
      onTap: () {
        showModalBottomSheet(context: context, builder: (context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text("History",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
                ...List.generate(
                    Provider.of<GoogleProvider>(context, listen: false)
                        .historylist
                        .length,
                        (index) =>ListTile(
                      onTap: () {
                        Provider.of<GoogleProvider>(context,listen: true).historylist[index];
                        Navigator.of(context).pop();
                      },
                      title:Text(Provider.of<GoogleProvider>(context,listen: false).historylist[index]),
                      subtitle: Text(Provider.of<GoogleProvider>(context,listen: true).historylist[index]),

                      trailing: IconButton(onPressed: () {
                        Provider.of<GoogleProvider>(context,listen: false).historyremove(index);
                      }, icon: Icon(Icons.cancel_rounded),),
                    ) ),

              ],
            ),
          );
        },);

      },
      child: Text('History'));
}