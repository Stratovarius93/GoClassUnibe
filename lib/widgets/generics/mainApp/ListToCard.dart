import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class ListToCard extends StatelessWidget {
  //final List<Elements> elements;
  //ListToCard({Key key, this.elements}):super(key: key);
  List<Elements> elements = [
    Elements(title: 'Página web de la UNIB.E', subtitle: 'unibe.edu.ec'),
    Elements(
        title: 'Plataforma virtual de aprendizaje',
        subtitle: 'moodle.unibe.edu.ec'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(
        color: colorAppTextLight,
      ),
      itemCount: elements.length,
      itemBuilder: (context, index) {
        return ItemContainer(
          color: colorAppGreen,
          title: elements[index].title,
          subtitle: elements[index].subtitle,
        );
      },
    );
  }
}

class Elements {
  String title;
  String subtitle;
  Elements({this.title, this.subtitle});
}

class ItemContainer extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  const ItemContainer({Key key, this.color, this.title, this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Text('${title[0]}',
              style: TextStyle(
                color: Colors.white,
                fontFamily: fontApp,
                fontSize: 20,
              )),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: colorAppTextDark,
                  fontFamily: fontApp,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: fontApp,
                  color: colorAppTextLight,
                  fontSize: 16,
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
