

import 'package:flutter/widgets.dart';

import '../utils/google_variable.dart';

class GoogleProvider extends ChangeNotifier{
  double progres=0;
  String search="Google";
  List<String> bookmarkList = [];
  List<String> history=[];
  String? currentUrl;
  String? title;
  void ChangeProgres(int progres){
    this.progres=progres/100;
    notifyListeners();
  }
  void Search(String search){
    this.search=search;
    notifyListeners();
  }
  void setCurrentUrl(String url){
    currentUrl = url;
    notifyListeners();
  }
  Future<void> addurl(url)
  async {

    currentUrl=url.toString();
     title=await inAppWebViewController.getTitle();
    notifyListeners();

  }
  void addBookMark(){
    bookmarkList.add(currentUrl!);
    notifyListeners();
  }
  void removehistory(index)
  {
    history.removeAt(index);
    notifyListeners();
  }
  void remove(index)
  {
    bookmarkList.removeAt(index);
    notifyListeners();
  }
}
