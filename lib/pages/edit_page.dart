import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pattern_mobx/models/post_model.dart';
import 'package:pattern_mobx/stores/edit_store.dart';

class EditPage extends StatefulWidget {

  Post post;

  EditPage({required this.post});
  static const String id = "/edit_page";
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  EditStore store = EditStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.nameController.text = widget.post.name;
    store.titleController.text = widget.post.title;
    store.bodyController.text = widget.post.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit page"),
      ),
      body: Observer(
        builder: (_) => Container(
          padding: const EdgeInsets.all(30),
          child: Stack(
            children: [
              Column(
                children: [
                  TextField(
                    controller: store.nameController,
                    decoration: const InputDecoration(
                        hintText: "Body",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  TextField(
                    controller: store.titleController,
                    decoration: const InputDecoration(
                        hintText: "Title",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  TextField(
                    controller: store.bodyController,
                    decoration: const InputDecoration(
                        hintText: "Body",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: (){
                      Post post = Post(name: store.nameController.text, title: store.titleController.text,
                          body: store.bodyController.text, dateTime: widget.post.dateTime, id: widget.post.id);
                      store.updatePost(post, context);
                    },
                    color: Colors.blueGrey,
                    child: const Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              store.isLoading ? const Center(
                child: CircularProgressIndicator(),
              ): const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
