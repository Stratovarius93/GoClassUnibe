import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/controllers/ScheduleController.dart';
import 'package:GoClassUnibe/models/scheduleModels.dart';
import 'package:flutter/material.dart';
import 'package:scroll_glow_color/widget/scroll_glow_color.dart';

List<int> _listIndex; //lista en blanco de indices

int _indexMax = 0;
final int _itemMaxLenght = 3; //limite maximo de horas por materia

List<ScheduleSignature> _listItemFinal = [];
_ScheduleDayState globalState;

class ScheduleDay extends StatefulWidget {
  final String dayName;
  final int indexMax;
  final List<int> listIndex;
  final List<ScheduleSignature> list;

  const ScheduleDay(
      {Key key,
      this.dayName,
      @required this.list,
      @required this.indexMax,
      @required this.listIndex})
      : super(key: key);
  @override
  _ScheduleDayState createState() => _ScheduleDayState();
}

class _ScheduleDayState extends State<ScheduleDay> {
  @override
  void initState() {
    super.initState();
    globalState = this;
    _indexMax = widget.indexMax;
    _listIndex = widget.listIndex;
    print(widget.dayName);
    _listItemFinal = dayInitState(_listItemFinal, widget.list);
    //print(_listItemFinal);
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      dayName: widget.dayName,
    );
  }
}

class HomePage extends StatefulWidget {
  final String dayName;
  const HomePage({Key key, this.dayName}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScrollGlowColor(
      color: colorAppSkyBlue.withOpacity(0.5),
      child: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final ScheduleSignature newString =
                _listItemFinal.removeAt(oldIndex);
            _listItemFinal.insert(newIndex, newString);
            reorderTime(_listItemFinal, _listIndex);
            print(_listItemFinal);
            print(widget.dayName);
          });
        },
        children: _listItemFinal.map((item) {
          var index = _listItemFinal.indexOf(item);
          if (item.name == 'Default') {
            return ElementDefault(
              key: UniqueKey(),
              title: item.timeStart.toString(),
              timeStart: item.timeStart,
              timeEnd: item.timeEnd,
              index: index,
            );
          } else {
            return ElementActive(
              key: UniqueKey(),
              title: item.name,
              color: item.color,
              indexIn: item.timeStart,
              indexOut: item.timeEnd,
              index: index,
              subtitle: item.classRoom,
            );
          }
        }).toList(),
      ),
    );
  }
}

class ElementDefault extends StatefulWidget {
  final String title;
  final int timeStart;
  final int timeEnd;
  final int index;
  const ElementDefault({
    Key key,
    this.title,
    this.timeStart,
    this.timeEnd,
    this.index,
  }) : super(key: key);

  @override
  _ElementDefaultState createState() => _ElementDefaultState();
}

class _ElementDefaultState extends State<ElementDefault> {
  @override
  Widget build(BuildContext context) {
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
                  widget.timeStart.toString().padLeft(2, '0') + ':00',
                  style: TextStyle(
                      color: Colors.blueGrey.shade300,
                      fontSize: 16,
                      fontFamily: fontApp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.timeEnd.toString().padLeft(2, '0') + ':00',
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
                  addFreeHour(_listItemFinal, widget.index, _indexMax,
                      _listIndex, context);
                  globalState.setState(() {});
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
                  deleteFreeHour(
                      _listItemFinal, widget.index, _indexMax, _listIndex);
                  globalState.setState(() {});
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
  final int indexIn;
  final int indexOut;
  final Color color;
  final String title;
  final String subtitle;
  final int index;

  const ElementActive({
    Key key,
    this.color,
    this.title,
    this.subtitle,
    this.indexIn,
    this.indexOut,
    this.index,
  }) : super(key: key);
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
        //trailing: _popupMenuSignature(index),
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
    List<String> _values = [
      'Mover a día...',
      'Añadir hora libre antes',
      'Añadir hora libre después'
    ];
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onSelected: (int value) {
        if (value == 0) {
          print('Mover');
        } else if (value == 1) {
          addFreeHourAbove(
              _listItemFinal, widget.index, _indexMax, _listIndex, context);
          globalState.setState(() {});
        } else {
          addFreeHourBelow(
              _listItemFinal, widget.index, _indexMax, _listIndex, context);
          globalState.setState(() {});
        }
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

List<ScheduleSignature> dayInitState(
    List<ScheduleSignature> listFinal, List<ScheduleSignature> list) {
  List<ScheduleSignature> _listDivided = listDivider(list, _indexMax);
  listFinal = generateEmptyList(_indexMax);
  generateFinalList(_listDivided, listFinal, _indexMax);
  //print(listFinal);
  return listFinal;
}
