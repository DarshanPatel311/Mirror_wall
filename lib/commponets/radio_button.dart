import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Google_Provider.dart';

RadioListTile<String> radiobutton(BuildContext context,String link,String name) {
  return RadioListTile(
    value: link,
    groupValue:
    Provider.of<GoogleProvider>(
        context,
        listen: true)
        .uri
        .toString(),
    onChanged: (value) {
      Provider.of<GoogleProvider>(context,
          listen: false).website(value!);
      Navigator.of(context).pop();
    },
  title: Text(name),
  );

}
