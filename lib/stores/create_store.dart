import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pattern_mobx/models/post_model.dart';
import 'package:pattern_mobx/services/http_service.dart';
part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  @observable bool isLoading = false;
  @observable TextEditingController nameController = TextEditingController();
  @observable TextEditingController titleController = TextEditingController();
  @observable TextEditingController bodyController = TextEditingController();

  // create post
  void postCreate(BuildContext context) async {
    isLoading = true;

    Post post = Post(name: nameController.text.trim(), title: titleController.text.trim(), body: bodyController.text.trim(), dateTime: DateTime.now().toString().substring(0, 16), id: "");
    final response = await HttpService.POST(HttpService.API_POST, HttpService.paramsCreate(post));

    print(response);

    if (response != null) {
      Navigator.of(context).pop(true);
    }
  }
}