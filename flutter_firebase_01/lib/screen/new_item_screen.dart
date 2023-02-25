import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_01/services/item_service.dart';

class NewItemScreen extends StatelessWidget {
  final _itemName = TextEditingController();
  final _itemDesc = TextEditingController();

  final ItemService _itemService = ItemService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(label: Text("Item Name")),
              controller: _itemName,
            ),
            TextField(
              decoration: const InputDecoration(label: Text("Item Description")),
              controller: _itemDesc,
            ),
            const SizedBox(
              height: 20,
              ),
            ElevatedButton(onPressed: _addItem, child: const Text("Save"))
          ],
        ),
      ),
    );
  }

  _addItem() {
    _itemService.addItem2Firebase(
      _itemName.text, 
      {"name": _itemName.text, "desc": _itemDesc.text});
  }
}
