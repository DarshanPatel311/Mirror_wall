import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


import '../utils/google_variable.dart';

class GoogleProvider extends ChangeNotifier {
  String search = "";
  double progres = 0;
  String? url;
  String? urlhistory;
  String? title;
  WebUri uri = WebUri('');
  List<String> bookmarklist = [];
  List<String> historylist = [];
  int browser = 0;

  void Search(String search) {
    this.search = search;
    notifyListeners();
  }

  void Progress(int progress) {
    this.progres = progress / 100;
    notifyListeners();
  }

  Future<void> addurl(url) async {
    url = url.toString();
    urlhistory = url.toString();
    title = await inAppWebViewController.getTitle();
    title = await inAppWebViewController.getTitle();
    notifyListeners();
  }

  void radio(int value) {
    browser = value;
    notifyListeners();
  }

  void addBookMarklist() {
    bookmarklist.add(url!);
    historylist.add(urlhistory!);
    notifyListeners();
  }

  void historyremove(index) {
    historylist.removeAt(index);
    notifyListeners();
  }

  void remove(index) {
    bookmarklist.removeAt(index);
    notifyListeners();
  }

  void website(value) {
    uri = WebUri(value);
    inAppWebViewController.loadUrl(urlRequest: URLRequest(url: uri));
  }
}
