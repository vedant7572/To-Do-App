import 'package:flutter/material.dart';
import 'package:to_do/util/my_buttons.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Task',
              ),
              controller: controller,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save Button
                MyButton(text: "Save", onPressed:onSave ),

                //cancel button
                MyButton(text: "Cancel", onPressed: onCancel ),
              ],
            )

          ],
        ),
      ),
    );

  }
}
