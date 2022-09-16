// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = "/Details";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isEditing = false;
  var fieldText = TextEditingController();

  String editString = "";

  void _startEditing() {
    setState(() {
      isEditing = true;
    });
  }

  void _endEditing () {
    setState(() {
      isEditing = false;
    });
  }

  void _updateText(String text) {
    setState(() {
      editString = text;
    });
  }

  void _updateItem() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Zmiany zostały zapisane!"),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var argText = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detale przedmiotu: $argText"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onDoubleTap: _startEditing,
                    child: Text(
                      "Przedmiot: $argText",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              if (isEditing) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: _updateText,
                    decoration: const InputDecoration(
                      hintText: "Edytuj przedmiot",
                      labelText: "Edytuj przedmiot",
                      prefixIcon: Icon(Icons.edit),
                      border: OutlineInputBorder(),
                    ),
                    controller: fieldText,
                  ),
                ),

                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: _updateItem,
                  child: const Text('Edytuj'),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: _endEditing,
                  child: const Text('Zamknij'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
