import 'package:flutter/material.dart';
import 'package:midterm_project/components/empty.dart';
import 'package:midterm_project/components/entrymodal.dart';
import 'package:midterm_project/components/itemlist.dart';
import 'package:midterm_project/model/items.dart';

class MyList extends StatefulWidget {
  MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List items = [];

  bool isListChecked = false;

  void openEntry() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: ItemEntries(addItem: addItem),
        ),
      ),
    );
  }

  void addItem(Items item) {
    setState(() {
      items.add(item);
    });
  }

  Widget deleteButtonAction() {
    return IconButton(
      onPressed: () {
        setState(() {
          items.removeRange(0, items.length);
        });
      },
      icon: const Icon(
        Icons.delete,
      ),
    );
  }

  void manageCheckAll() {
    setState(() {
      for (Items i in items) {
        i.isDone = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => manageCheckAll(),
            icon: Icon(Icons.check_circle_outline_outlined),
          ),
          title: const Text(
            "Shopping List",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          actions: [
            deleteButtonAction(),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: items.isNotEmpty
                      ? ItemList(items: items)
                      : Empty(openEntry: openEntry),
                )
              ],
            ),
            Positioned(
              bottom: 12,
              right: 12,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                padding: EdgeInsets.all(12.0),
                onPressed: () {
                  openEntry();
                },
                icon: Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
