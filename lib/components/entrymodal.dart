import 'package:flutter/material.dart';
import 'package:midterm_project/model/items.dart';

class ItemEntries extends StatefulWidget {
  ItemEntries({super.key, required this.addItem});

  final Function(Items item) addItem;

  @override
  State<ItemEntries> createState() => _ItemEntriesState();
}

class _ItemEntriesState extends State<ItemEntries> {
  var itemController = TextEditingController();

  void addNewItem() {
    if (itemController.text != "") {
      Items item = Items(item: itemController.text);
      widget.addItem(item);
      itemController.text = "";
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          ),
          TextField(
            controller: itemController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Add Item"),
              hintText: "Item name",
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => addNewItem(),
                  child: Text("Add item"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
