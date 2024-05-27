import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


import 'package:provider/provider.dart';

import '../commponets/bottom_bar.dart';
import '../commponets/popup_menu.dart';
import '../provider/Google_Provider.dart';

late InAppWebViewController inAppWebViewController;
PullToRefreshController pullrefreshcontroller = PullToRefreshController(
    onRefresh: ()
    {
      inAppWebViewController.reload();
    }
);
TextEditingController txtsearch =TextEditingController();

class Google extends StatelessWidget {
  const Google({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Container(
                  height: 40,
                  width: 300,
                  child: TextFormField(
                    controller: txtsearch,
                    decoration: InputDecoration(
                        hintText: 'Search ',
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            Provider.of<GoogleProvider>(context, listen: false)
                                .Search(txtsearch.text);
                            inAppWebViewController.loadUrl(
                                urlRequest: URLRequest(
                                    url: WebUri(
                                        'https://www.google.com/search?q=${Provider.of<GoogleProvider>(context, listen: false).search}&rlz=1C1ONGR_enIN1095IN1095&oq=flutter&gs_lcrp=EgZjaHJvbWUqDggAEEUYJxg7GIAEGIoFMg4IABBFGCcYOxiABBiKBTIGCAEQRRg7MgkIAhAAGBMYgAQyCQgDEAAYExiABDIJCAQQABgTGIAEMgYIBRBFGD0yBggGEEUYPDIGCAcQRRg80gEJMTIxODJqMGo3qAIAsAIA&sourceid=chrome&ie=UTF-8')));
                          },
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Provider.of<GoogleProvider>(context, listen: false).addBookMarklist();

                  },
                  child: Icon(
                    Icons.star_border,
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.file_download_outlined,
                  size: 25,
                ),

                MenuBox(),
              ],
            )),
      ),

      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                url: WebUri(
                    'https://www.google.com/search?q=${Provider.of<GoogleProvider>(context, listen: false).search}&sca_esv=680b12c94771f77f&sca_upv=1&sxsrf=ADLYWIL7yMbHTwni04YbecJFVZ7z8KBb-Q%3A1716530603795&source=hp&ei=qy1QZv6-Lbux0-kPmLuOmAc&iflsig=AL9hbdgAAAAAZlA7u_40g8VdlYlIob8vNwe2yXXNXUIj&oq=&gs_lp=Egdnd3Mtd2l6IgAqAggAMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCSLwRUABYAHABeACQAQCYAQCgAQCqAQC4AQHIAQCYAgGgAgyoAgqYAwySBwExoAcA&sclient=gws-wiz')),
            onWebViewCreated: (controller) {
              inAppWebViewController = controller;
            },
            onProgressChanged: (controller, progress) {
              Provider.of<GoogleProvider>(context, listen: false)
                  .Progress(progress);
            },
            onLoadStop: (controller, url) {
              Provider.of<GoogleProvider>(context, listen: false)
                  .addurl(url.toString());
              pullrefreshcontroller.endRefreshing();
            },
            pullToRefreshController: pullrefreshcontroller,
          ),
          (Provider.of<GoogleProvider>(context, listen: true).progres < 1)
              ? Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
              value: Provider.of<GoogleProvider>(context, listen: true)
                  .progres,
            ),
          )
              : Container(),
        ],
      ),
      bottomNavigationBar: bottomBar(),
    );;
  }
}


