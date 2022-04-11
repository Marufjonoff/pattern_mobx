import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_mobx/models/post_model.dart';
import 'package:pattern_mobx/stores/home_store.dart';


Slidable itemOfListPayment(Post post, BuildContext context, HomeStore store) {
  return Slidable(
    // Specify a key if the Slidable is dismissible.
    key: const ValueKey(0),

    // The start action pane is the one at the left or the top side.
    endActionPane: ActionPane(
      motion: const BehindMotion(),
      children: [
        SlidableAction(
          onPressed: (context) => store.apiDelete(post.id),
              // BlocProvider.of<ListPostCubit>(context).apiDelete(patternApi.id),
          backgroundColor: Colors.blueGrey.shade700,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          flex: 1,
        ),
      ],
    ),
    startActionPane: ActionPane(
      motion: const BehindMotion(),
      children: [
          SlidableAction(
            onPressed: (context) => store.callEditPage(context, post),
            backgroundColor: Colors.blueGrey.shade700,
            foregroundColor: Colors.green,
            icon: Icons.edit,
            flex: 1,
        ),
      ],
    ),
    child: Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.name),
            const SizedBox(
              height: 5,
            ),
            Text(post.title),
            const SizedBox(
              height: 5,
            ),
            Text(post.body),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerRight,
              height: 15,
              width: MediaQuery.of(context).size.width,
              child: Text(post.dateTime),
            )
          ],
        ),
      ),
    ),
  );
}