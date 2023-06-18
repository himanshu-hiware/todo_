import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';
class DialogBox extends StatelessWidget {
  final controler;
  VoidCallback onSave;
  VoidCallback onCancle;
   DialogBox({
    Key? key,
     required this.controler,
     required this.onSave,
     required this.onCancle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // user input

          children: [
            TextField(
              controller: controler,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "New Task ",
              ),
            ),
          // button save and cancle
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
             children:[
               //save button
              Mybutton(text: "save", onPressed:onSave),
               const SizedBox(width: 8),
               // cancle button
              Mybutton(text: "cancle", onPressed:onCancle),
             ],
            ),

        ]),
      ),
    );
  }
}
