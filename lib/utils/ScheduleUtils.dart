import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/models/ScheduleModel.dart';
import 'package:flutter/material.dart';

void reorderTime(List<ScheduleSignature> list, List<int> listIndex) {
  for (var i = 0, len = listIndex.length; i < len; ++i) {
    list[i].timeStart = listIndex[i] + 7;
  }
  for (var i = 0, len = listIndex.length; i < len; ++i) {
    list[i].timeEnd = (listIndex[i] + 1) + 7;
  }
}

List<ScheduleSignature> listDivider(
    List<ScheduleSignature> list, int indexMax) {
  List<int> listIndex = [];
  List<ScheduleSignature> newList = [];
  int sum = 0;
  for (var i = 0, len = list.length; i < len; ++i) {
    listIndex.add(list[i].timeEnd - list[i].timeStart);
    sum = sum + (list[i].timeEnd - list[i].timeStart);
  }
  //print(listIndex);
  //print(sum);
  if (sum <= indexMax) {
    for (var i = 0, len = list.length; i < len; ++i) {
      if (list[i].timeEnd - list[i].timeStart > 1) {
        for (var j = 0, len = (list[i].timeEnd - list[i].timeStart);
            j < len;
            ++j) {
          newList.add(ScheduleSignature(
              timeStart: list[i].timeStart + j,
              timeEnd: (list[i].timeStart + j + 1),
              name: list[i].name,
              teacher: list[i].teacher,
              classRoom: list[i].classRoom,
              color: list[i].color));
        }
      } else {
        newList.add(ScheduleSignature(
            timeStart: list[i].timeStart,
            timeEnd: list[i].timeEnd,
            name: list[i].name,
            classRoom: list[i].classRoom,
            color: list[i].color));
      }
    }
  } else {
    print('ERROR: The limit should must be less than $indexMax');
    for (var i = 0, len = list.length; i < len; ++i) {
      if (list[i].timeEnd - list[i].timeStart > 1) {
        newList.add(ScheduleSignature(
            timeStart: list[i].timeStart,
            timeEnd: list[i].timeStart + 1,
            name: list[i].name,
            classRoom: list[i].classRoom,
            color: list[i].color));
        print(
            'Changed the size of ${list[i].name}, from ${(list[i].timeEnd - list[i].timeStart)} to 1');
      } else {
        newList.add(ScheduleSignature(
            timeStart: list[i].timeStart,
            timeEnd: list[i].timeEnd,
            name: list[i].name,
            classRoom: list[i].classRoom,
            color: list[i].color));
      }
    }
  }
  return newList;
}

void addFreeHourAbove(List<ScheduleSignature> list, int index, int indexMax,
    List<int> listIndex, BuildContext context) {
  if (list[indexMax - 1].name == 'Default') {
    ScheduleSignature newScheduleSignature = list.removeAt(indexMax - 1);
    list.insert(index, newScheduleSignature);
    reorderTime(list, listIndex);
  } else {
    showAlertDialog(
        context,
        'Hora libre no disponible',
        'Se recomienda reorganizar las horas libres disponibles entre las otras materias',
        'Entendido');
  }
}

void addFreeHourBelow(List<ScheduleSignature> list, int index, int indexMax,
    List<int> listItem, BuildContext context) {
  if (index == indexMax - 1) {
    showAlertDialog(
        context,
        'Hora libre no disponible',
        'Se recomienda reorganizar las horas libres disponibles entre las otras materias',
        'Entendido');
  } else if (list[indexMax - 1].name == 'Default') {
    ScheduleSignature newScheduleSignature = list.removeAt(indexMax - 1);
    list.insert(index + 1, newScheduleSignature);
    reorderTime(list, listItem);
  } else {
    showAlertDialog(
        context,
        'Hora libre no disponible',
        'Se recomienda reorganizar las horas libres disponibles entre las otras materias',
        'Entendido');
  }
}

void deleteFreeHour(List<ScheduleSignature> list, int index, int indexMax,
    List<int> listIndex) {
  final ScheduleSignature newScheduleSignature = list.removeAt(index);
  list.insert(list.length, newScheduleSignature);
  reorderTime(list, listIndex);
}

void addFreeHour(List<ScheduleSignature> list, int index, int indexMax,
    List<int> listIndex, BuildContext context) {
  if (list[indexMax - 1].name == 'Default') {
    ScheduleSignature newScheduleSignature = list.removeAt(indexMax - 1);
    list.insert(index, newScheduleSignature);
    reorderTime(list, listIndex);
  } else {
    showAlertDialog(
        context,
        'Hora libre no disponible',
        'Se recomienda reorganizar las horas libres disponibles entre las otras materias',
        'Entendido');
  }
}

List<ScheduleSignature> generateEmptyList(int indexMax) {
  List<ScheduleSignature> listIndex = List<ScheduleSignature>.generate(
      indexMax,
      (int item) => ScheduleSignature(
          timeStart: item + 7,
          timeEnd: (item + 7) + 1,
          name: 'Default',
          classRoom: 'Aula',
          color: Colors.transparent));
  return listIndex;
}

void generateFinalList(List<ScheduleSignature> listDivided,
    List<ScheduleSignature> list, int indexMax) {
  for (var i = 0, len = indexMax; i < len; ++i) {
    for (var j = 0, len = listDivided.length; j < len; ++j) {
      if (i == listDivided[j].timeStart - 7) {
        list[i] = listDivided[j];
      }
    }
  }
  //print(_listItemFinal.toString());
}

List<ScheduleSignature> validateListDay(
    List<ScheduleSignature> list, String dayName) {
  List<ScheduleSignature> newList = [];
  for (var i = 0, len = list.length; i < len; ++i) {
    if (list[i].day == dayName) {
      ScheduleSignature newSignature = ScheduleSignature(
          timeStart: list[i].timeStart,
          timeEnd: list[i].timeEnd,
          name: list[i].name,
          color: list[i].color,
          teacher: list[i].teacher,
          day: list[i].day,
          classRoom: list[i].classRoom);
      newList.add(newSignature);
    }
  }
  return newList;
}

void moveToDay(List<ScheduleSignature> listFrom, List<ScheduleSignature> listTo,
    int indexFrom, List<int> listIndex, BuildContext context) {
  //verificar si hay espacio disponible
  int count = 0;
  for (var i = 0, len = listTo.length; i < len; ++i) {
    if (listTo[i].name == 'Default') {
      count++;
    }
  }
  if (count > 0) {
    if (listTo[listTo.length - 1].name == 'Default') {
      //removemos del primer list
      ScheduleSignature newItem = ScheduleSignature(
          name: 'Default',
          timeStart: (listFrom.length + 7) - 1,
          timeEnd: listFrom.length + 7,
          color: Colors.transparent);
      final item = listFrom.removeAt(indexFrom);
      listFrom.insert(listFrom.length, newItem);
      reorderTime(listFrom, listIndex);
      //anadimos al segundo list
      listTo.removeAt(listFrom.length - 1);
      listTo.insert(0, item);
      reorderTime(listTo, listIndex);
    } else {
      showAlertDialog(
          context,
          'Horas no disponibles en el día seleccionado',
          'Se recomienda reorganizar las horas libres disponibles entre las otras materias',
          'Entendido');
    }
  }
}

void showAlertDialog(
    BuildContext context, String title, String description, String action) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(color: colorAppTextDark, fontFamily: fontApp),
          ),
          content: Text(
            description,
            style: TextStyle(color: colorAppTextDark, fontFamily: fontApp),
          ),
          actions: [
            FlatButton(
              child: Text(action, style: TextStyle(fontFamily: fontApp)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      });
}
