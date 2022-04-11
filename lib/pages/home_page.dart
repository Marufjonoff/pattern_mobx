import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pattern_mobx/stores/home_store.dart';
import 'package:pattern_mobx/views/home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "/home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = HomeStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.apiGet();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MobX"),
      ),
      body: Observer(
        builder: (_) => store.isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: store.items.length,
          itemBuilder: (context, index) {
            return itemOfListPayment(store.items[index], context, store);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          store.callCreatePage(context);
        },
        child: const Icon(
          Icons.add
        ),
      ),
    );
  }
}
