import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  final List items;

  ItemList({super.key, required this.items});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.items
              .map(
                (e) => Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e.item,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: e.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationThickness: 2,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              e.isDone = !e.isDone;
                            });
                          },
                          icon: Icon(e.isDone
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                        )
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
