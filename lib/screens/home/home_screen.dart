import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/details/details_screen.dart';
class HomeScreen extends StatefulWidget {
  static const routeName = "/";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listItems = [];
  String newTodo = "";
  final fieldText = TextEditingController();

  void _addItem(String text) {
    if (newTodo == "") {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Nie można dodać pustego zadania!"),
        )
      );
    }
    setState(() {
      listItems.add(newTodo);
      newTodo = "";
    });
    fieldText.clear();
  }

  void _onChanged(String text) {
    setState(() {
      newTodo = text;
    });
  }

  void _deteteAll () {
    setState(() {
      listItems = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (newTodo == "") {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("Nie można dodać pustego zadania!"),
                )
              );
            }
            setState(() {
              listItems.add(newTodo);
              newTodo = "";
            });
            fieldText.clear();
          },
          child: const Icon(Icons.plus_one),
        ),
        appBar: AppBar(
          title: const Text("Mój pierwszy flutterowy projekt"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                onChanged: _onChanged,
                onSubmitted: _addItem,
                decoration: const InputDecoration(
                  hintText: "wpisz coś",
                  labelText: "testowy input",
                  prefixIcon: Icon(Icons.ac_unit),
                  border: OutlineInputBorder(),
                ),
                controller: fieldText,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listItems.length,
                  itemBuilder: ((context, index) {
                    final item = listItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onDoubleTap: (() => {
                          setState(() {
                            listItems.removeAt(index);
                          })
                        }),
                        onTap: (() {
                          Navigator.pushNamed(context, DetailsScreen.routeName, arguments: item);
                        }),
                        child: Text(item),
                      ),
                    );
                  }),
                ),
              ),
              GestureDetector(
                onTap: _deteteAll,
                child: const Text("Usuń wszystko"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
