import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/Google_Provider.dart';

InkWell BookMark(BuildContext context) {
  return InkWell(
      onTap: () {
        showModalBottomSheet(context: context, builder: (context){
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(

              children: [
                Text("BookMark",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                ...List.generate(
                    Provider.of<GoogleProvider>(context, listen: false)
                        .bookmarklist
                        .length,
                        (index) =>ListTile(
                      onTap: () {
                        Provider.of<GoogleProvider>(context,listen: true).bookmarklist[index];
                        Navigator.of(context).pop();
                      },
                      title:Text(Provider.of<GoogleProvider>(context,listen: false).bookmarklist[index]),
                      subtitle: Text(Provider.of<GoogleProvider>(context,listen: true).bookmarklist[index]),

                      trailing: IconButton(onPressed: () {
                        Provider.of<GoogleProvider>(context,listen: false).remove(index);
                      }, icon: Icon(Icons.cancel_rounded),),
                    ) ),

              ],
            ),
          );
        },);

      },
      child: Text('All BookMarks'));
}