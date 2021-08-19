import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refactory_test/model/todo_model.dart';

class AddTodoPage extends StatefulWidget {
  final String? title;
  final String? description;
  final ValueChanged<String>? onChangedTitle;

  const AddTodoPage({
    Key? key,
    this.title,
    this.description,
    this.onChangedTitle,
  }) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              initialValue: widget.title,
              onChanged: widget.onChangedTitle,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Please fill the label?',
                labelText: 'Label *',
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: null,
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
