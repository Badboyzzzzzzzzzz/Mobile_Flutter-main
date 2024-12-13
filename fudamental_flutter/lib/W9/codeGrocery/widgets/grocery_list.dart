import 'package:flutter/material.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  Mode currentState = Mode.normal;
  Set<GroceryItem> selectedItems = {};

  void _addItem(GroceryItem newItem) {
    setState(() {
      dummyGroceryItems.add(newItem);
    });
  }

  void _editItem(int index, GroceryItem updatedItem) {
    setState(() {
      dummyGroceryItems[index] = updatedItem;
    });
  }

  void _navigateToNewItem() {
    Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(
        builder: (context) => NewItem(
          onSubmit: _addItem,
          mode: Mode.creating,
        ),
      ),
    );
  }

  void _navigateToEditItem(int index) {
    Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(
        builder: (context) => NewItem(
          onSubmit: (updatedItem) => _editItem(index, updatedItem),
          mode: Mode.editing,
          existingItem: dummyGroceryItems[index],
        ),
      ),
    );
  }

  void _setSelectionMode() {
    setState(() {
      currentState = Mode.selection;
    });
  }

  void _setNormalMode() {
    setState(() {
      selectedItems.clear();
      currentState = Mode.normal;
    });
  }

  void _itemSection(GroceryItem index) {
    setState(() {
      if (selectedItems.contains(index)) {
        selectedItems.remove(index);
      } else {
        selectedItems.add(index);
      }
    });
  }

  void _removeSelection() {
    setState(() {
      dummyGroceryItems
          .removeWhere((groceryItem) => selectedItems.contains(groceryItem));
      selectedItems.clear();
      currentState = Mode.normal;
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      print("new Index : ${newIndex}");
      print('Old Index: ${oldIndex}');
      final item = dummyGroceryItems.removeAt(oldIndex);
      dummyGroceryItems.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: currentState == Mode.normal
              ? const Text('Your Groceries')
              : Text('${selectedItems.length} item(s)'),
          leading: currentState == Mode.selection
              ? IconButton(
                  onPressed: _setNormalMode, icon: const Icon(Icons.arrow_back))
              : null,
          actions: currentState == Mode.normal
              ? [
                  IconButton(
                    onPressed: _navigateToNewItem,
                    icon: const Icon(Icons.add),
                  ),
                ]
              : [
                  IconButton(
                    onPressed: _removeSelection,
                    icon: const Icon(Icons.delete),
                  ),
                ]),
      body: dummyGroceryItems.isEmpty
          ? const Center(
              child: Text('No items added yet.'),
            )
          : ReorderableListView.builder(
              onReorder: _onReorder,
              itemCount: dummyGroceryItems.length,
              itemBuilder: (ctx, index) => ListTile(
                key: ValueKey(dummyGroceryItems[index]),
                title: Text(dummyGroceryItems[index].name),
                leading: currentState == Mode.selection
                    ? Checkbox(
                        value: selectedItems.contains(dummyGroceryItems[index]),
                        onChanged: (_) =>
                            _itemSection(dummyGroceryItems[index]))
                    : Container(
                        width: 24,
                        height: 24,
                        color: dummyGroceryItems[index].category.color,
                      ),
                trailing: Row(
                  mainAxisSize:
                      MainAxisSize.min, // Ensures the row takes minimal space
                  children: [
                    Text(
                      dummyGroceryItems[index].quantity.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                        width: 8), // Add spacing between quantity and handle
                  ],
                ),
                onLongPress: () => _setSelectionMode(),
                onTap: () => _navigateToEditItem(index),
              ),
            ),
    );
  }
}
