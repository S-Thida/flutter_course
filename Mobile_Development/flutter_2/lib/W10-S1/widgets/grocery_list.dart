import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';
 
class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  
  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(mode: Mode.creating)),
      );
    
    if (newItem != null) {
      setState(() {
        dummyGroceryItems.add(newItem);
      });
    }
  }

  void _editItem(GroceryItem item) async {
    final editItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(mode: Mode.editing),
      ),
    );
    if (_editItem != null) {
      setState(() {
     final grcoeryIndex= dummyGroceryItems.indexWhere((element)=> element.id==item.id);
    if(grcoeryIndex !=-1){
      dummyGroceryItems[grcoeryIndex]=editItem!;
    }
      });
    }
  
  }
  
void _reorderableList(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = dummyGroceryItems.removeAt(oldIndex);
      dummyGroceryItems.insert(newIndex, item);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = ReorderableListView.builder(
        key: const PageStorageKey(''),
        onReorder: _reorderableList,
        itemCount: dummyGroceryItems.length,
        itemBuilder: (ctx, index) => GroceryTile( key: ValueKey(dummyGroceryItems[index].id),dummyGroceryItems[index],
        onTap: _editItem,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed:  _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  final Function onTap;
  const GroceryTile(this.groceryItem, {super.key, required this.onTap});

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryItem.name),
      leading: Container(
        width: 24,
        height: 24,
        color: groceryItem.category.color,
      ),
      trailing: Text(
        groceryItem.quantity.toString(),
      ),
      onTap: ()=>onTap(groceryItem),
    );
  }
}
