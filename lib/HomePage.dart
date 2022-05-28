import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List items = <String>[];

  var _controler = TextEditingController(text: "");
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter todo"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  if (_controler.text != "") {
                                    items.add(_controler.text);
                                    Fluttertoast.showToast(
                                        msg: "added ${_controler.text}");
                                    _controler.clear();
                                    setState(() {});
                                    Navigator.pop(context);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "please enter a text to add!");
                                  }
                                },
                                child: Text("add")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("cancel")),
                          ],
                          title: Text("Add Tast"),
                          content: WillPopScope(
                            onWillPop: () => Future.value(false),
                            child: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _controler,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                        hintText: "text",
                                        helperText: "enter your text",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ui(items[index], index, (index) {
              items.removeAt(index);
              setState(() {});
              Fluttertoast.showToast(msg: " item no ${index+1} deleted");
            });
          },
        ));
  }
}
