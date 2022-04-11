import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pattern_mobx/models/post_model.dart';
import 'package:pattern_mobx/pages/detail_page.dart';
import 'package:pattern_mobx/pages/edit_page.dart';
import 'package:pattern_mobx/services/http_service.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable List<Post> items = [];
  @observable bool isLoading = true;

  // get
  Future<void> apiGet() async {
    isLoading = true;

    var response = await HttpService.GET(HttpService.API_USERS, HttpService.paramEmpty());
    items = HttpService.parsePatternApi(response!);

    isLoading = false;
  }


  // api delete
  void apiDelete(String userId) async {
    isLoading = true;

    final response = await HttpService.DELETE(HttpService.apiDelete(userId), HttpService.paramEmpty());
    print(response);
    apiGet();
    isLoading = false;
  }

  // to create page
  void callCreatePage(BuildContext context) async {
    var result = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return DetailPage();
    }));

    if(result == true) {
      apiGet();
    }
  }

  // to edit page
  void callEditPage(BuildContext context, Post post) async {
    var result = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return EditPage(post: post);
    }));

    if(result == true) {
      apiGet();
    }
  }
}