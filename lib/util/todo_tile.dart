import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_slidable/flutter_slidable.dart';
class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskstatus;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deltask;
   TodoTile({
     Key? key,
     required this.taskname,
     required this.taskstatus,
     required this.onChanged,
     required this.deltask,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: deltask,

                backgroundColor: Colors.red.shade400,
                borderRadius: BorderRadius.circular(12),
                icon: Icons.delete,
              )
            ]
        ),
           //
           child: ClipRect(
             child: Container(
              height: 100.0,
              width: 400.0,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(12),
              ),
               child:  Row(
                 children: [
                   // checkbox
                   Checkbox(
                     value: taskstatus,
                     onChanged: onChanged,
                     activeColor: Colors.green,

                   ),

                   // task name
                   Text(
                     taskname,
                     style: TextStyle(
                       decoration: taskstatus
                           ? TextDecoration.lineThrough
                           : TextDecoration.none,
                     ),
                   ),
                 ],
               ),
              ),
           ),
        ),

    );
  }
}
