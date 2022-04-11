import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pattern_mobx/stores/create_store.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  static const String id = "/detail_page";
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  CreateStore store = CreateStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Create"),
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
                      store.postCreate(context);
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
