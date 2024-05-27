import 'package:flutter/material.dart';
import 'package:mirror_wall/commponets/radio_button.dart';

import 'book_mark.dart';
import 'history.dart';

PopupMenuButton<dynamic> MenuBox() {
  return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.bookmark_add_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    BookMark(context),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.image_search),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.white,
                              title:
                              Center(child: Text('Search Engine')),
                              actions: [
                                radiobutton(context,'https://www.google.com','Google'),
                                radiobutton(context,'https://in.search.yahoo.com/','Yahoo'),
                                radiobutton(context,'https://www.bing.com/','Bing'),
                                radiobutton(context,'https://duckduckgo.com/','Duck Duck Go'),
                              ],
                            ),
                          );
                        },
                        child: Text('Search Engine')),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.history),
                    SizedBox(
                      width: 10,
                    ),
                    History(context),
                  ],
                ),
              ],
            ))
      ]);
}