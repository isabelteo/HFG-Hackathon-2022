import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PostList());
  }
}

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  // save data
  final List<String> _postList = <String>[];
  // text field
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: _getItems()),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Post',
          child: Icon(Icons.add)),
    );
  }

  void _addPostItem(String title) {
    setState(() {
      _postList.add(title);
    });
    _textFieldController.clear();
  }

  Widget _buildPostItem(String title) {
    return Container(
        child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20),)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('CHAT'),
                    icon: const Icon(
                      Icons.chat,
                      size: 24.0,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 30),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('DONATE'),
                    icon: const Icon(
                      Icons.volunteer_activism,
                      size: 24.0,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ]
        ),
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.only(top:50.0, right: 50.0, left: 50.0, bottom: 20.0),
        decoration: const BoxDecoration(
          color: Color(0xFFC3DFE5),
        )
    );
  }

  Future<Future> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Share your Story'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Whats on your mind'),
            ),
            actions: <Widget>[
              // add button
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addPostItem(_textFieldController.text);
                },
              ),
              // Cancel button
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  List<Widget> _getItems() {
    final List<Widget> _postWidgets = <Widget>[];
    for (String title in _postList) {
      _postWidgets.add(_buildPostItem(title));
    }
    return _postWidgets;
  }
}
