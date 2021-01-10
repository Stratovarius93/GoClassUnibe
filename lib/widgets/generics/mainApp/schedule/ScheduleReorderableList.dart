import 'package:GoClassUnibe/providers/Schedule2Provider.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/schedule/ScheduleElements.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReorderableListItems extends StatefulWidget {
  @override
  _ReorderableListItemsState createState() => _ReorderableListItemsState();
}

class _ReorderableListItemsState extends State<ReorderableListItems> {
  @override
  Widget build(BuildContext context) {
    final schedule2Provider = Provider.of<Schedule2Provider>(context);
    return Expanded(
      child: ReorderableListView(
        children: schedule2Provider
            .getSignatureList()
            .map((elem) {
              var _index = schedule2Provider.getSignatureList().indexOf(elem);
              if (elem.name == 'Default') {
                return ElementDefault(
                    key: UniqueKey(),
                    title: 'Hora libre',
                    indexIn: elem.timeStart,
                    indexOut: elem.timeEnd,
                    index: _index,
                );
              }else{
              return ElementActive(
                    key: UniqueKey(),
                    title: elem.name,
                    subtitle: elem.classRoom,
                    indexIn: elem.timeStart,
                    indexOut: elem.timeEnd,
                    color: elem.color,
                    index: _index,
            );}
            })
            .toList(),
        onReorder: (oldIndex, newIndex) {
          schedule2Provider.setListFinal(oldIndex, newIndex);
        },
      ),
    );
  }
}
