import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/providers/ScheduleProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElementDefault extends StatelessWidget {
  final String title;
  final int indexIn;
  final int indexOut;
  final int index;

  const ElementDefault(
      {Key key, this.title, this.indexIn, this.indexOut, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scheduleProvider = Provider.of<ScheduleProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100.withOpacity(0.18),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 58,
      margin: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  indexIn.toString().padLeft(2, '0') + ':00',
                  style: TextStyle(
                      color: Colors.blueGrey.shade300,
                      fontSize: 16,
                      fontFamily: fontApp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  indexOut.toString().padLeft(2, '0') + ':00',
                  style: TextStyle(
                      color: Colors.blueGrey.shade300,
                      fontFamily: fontApp,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Hora libre',
                style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: fontApp),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.add,
                    color: Colors.blueGrey.shade300,
                  ),
                ),
                onTap: () {
                  scheduleProvider.setSelectecFreeHourAddHour(context, index);
                },
              ),
              InkWell(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.delete,
                    color: Colors.blueGrey.shade300,
                  ),
                ),
                onTap: () {
                  scheduleProvider.setSelectecFreeHourRemoveHour(index);
                },
              ),
              SizedBox(
                width: 16,
              )
            ],
          )
        ],
      ),
    );
  }
}

class ElementActive extends StatelessWidget {
  final String title;
  final int indexIn;
  final int indexOut;
  final Color color;
  final String subtitle;
  final int index;

  const ElementActive(
      {Key key,
      this.title,
      this.indexIn,
      this.indexOut,
      this.color,
      this.subtitle,
      this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: color),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                indexIn.toString().padLeft(2, '0') + ':00',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: fontApp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                indexOut.toString().padLeft(2, '0') + ':00',
                style: TextStyle(
                    fontSize: 16, fontFamily: fontApp, color: Colors.white),
              ),
            ],
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
              color: colorAppTextDark,
              fontFamily: fontApp,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: colorAppTextLight, fontFamily: fontApp),
        ),
        trailing: _PopupMenuItem(
          index: index,
        ),
      ),
    );
  }
}

class _PopupMenuItem extends StatefulWidget {
  final int index;
  _PopupMenuItem({
    Key key,
    this.index,
  }) : super(key: key);
  @override
  __PopupMenuItemState createState() => __PopupMenuItemState();
}

class __PopupMenuItemState extends State<_PopupMenuItem> {
  @override
  Widget build(BuildContext context) {
    final schedule2Provider = Provider.of<ScheduleProvider>(context);
    List<String> _values = [
      'Añadir hora libre antes',
      'Añadir hora libre después'
    ];
    for (var i = 0, len = schedule2Provider.getDaySelected().length;
        i < len;
        ++i) {
      _values.add('Mover al ' + schedule2Provider.getDaySelected()[i]);
    }
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onSelected: (int value) {
        schedule2Provider.setSelectecSignature(value, context, widget.index);
      },
      elevation: 4,
      offset: Offset(0, 100),
      itemBuilder: (BuildContext context) {
        return _values.map((item) {
          var index = _values.indexOf(item);
          return PopupMenuItem(
            child: Text(
              item,
              style: TextStyle(color: colorAppTextDark, fontFamily: fontApp),
            ),
            value: index,
          );
        }).toList();
      },
    );
  }
}
