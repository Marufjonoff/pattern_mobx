import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pattern_mobx/models/post_model.dart';
import 'package:pattern_mobx/services/http_service.dart';

part 'edit_store.g.dart';

class EditStore = _EditStore with _$EditStore;

abstract class _EditStore with Store {
  @observable bool isLoading = false;
  @observable TextEditingController nameController = TextEditingController();
  @observable TextEditingController titleController = TextEditingController();
  @observable TextEditingController bodyController = TextEditingController();

  // update post
  void updatePost(Post post, BuildContext context) async{
    isLoading = true;

    final response = await HttpService.PUT(HttpService.apiPatch(post.id), HttpService.paramsCreate(post));
    if (response != null) {
      Navigator.of(context).pop(true);
    }
  }

}