import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';

import 'empty_grocery_screen.dart';
import 'grocery_item_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 6
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO: Present GroceryItemScreen
          final manager = Provider.of<GroceryManager>(context, listen: false);
// 2
          Navigator.push(
            context,
// 3
            MaterialPageRoute(
// 4
              builder: (context) => GroceryItemScreen(
// 5
                onCreate: (item) {
// 6
                  manager.addItem(item);
// 7
                  Navigator.pop(context);
                },
// 8
                onUpdate: (item) {},
              ),
            ),
          );
        },
      ),
// 7
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
// 1
    return Consumer<GroceryManager>(
      // 2
      builder: (context, manager, child) {
// 3
        if (manager.groceryItems.isNotEmpty) {
          // TODO: Add GroceryListScreen
          return Container();
        } else {
          // 4
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
