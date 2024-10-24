import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  Empty({super.key, required this.openEntry});

  final Function openEntry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              "./assets/images/empty.png",
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Your Shopping List is Empty",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black45),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            onPressed: () => openEntry(),
            child: Text("Add item"),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
