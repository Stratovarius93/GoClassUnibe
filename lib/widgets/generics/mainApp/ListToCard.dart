import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ListToCard extends StatelessWidget {
  //final List<Elements> elements;
  //ListToCard({Key key, this.elements}):super(key: key);
  List<Elements> elements = [
    Elements(
      title: 'Página web de la UNIB.E',
      subtitle: 'unibe.edu.ec',
      url: 'https://www.unibe.edu.ec',
      color: colorAppBlue,
    ),
    //Elements(
    //title: 'Plataforma virtual de aprendizaje',
    //subtitle: 'moodle.unibe.edu.ec',
    //url: 'https://moodle.unibe.edu.ec',
    //color: colorAppSkyBlue
    //),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(
        color: colorAppTextLight,
      ),
      itemCount: elements.length,
      itemBuilder: (context, index) {
        return ItemContainer(
          color: elements[index].color,
          title: elements[index].title,
          subtitle: elements[index].subtitle,
          url: elements[index].url,
        );
      },
    );
  }
}

class Elements {
  String title;
  String subtitle;
  String url;
  Color color;
  Elements({this.title, this.subtitle, this.url, this.color});
}

class ItemContainer extends StatefulWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String url;
  const ItemContainer(
      {Key key, this.color, this.title, this.subtitle, this.url})
      : super(key: key);
  @override
  _ItemContainerState createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        CircleAvatar(
          backgroundColor: widget.color,
          child: Text('${widget.title[0]}',
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
            child: InkWell(
          onTap: () => launch(widget.url),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
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
                widget.subtitle,
                style: TextStyle(
                  fontFamily: fontApp,
                  color: colorAppTextLight,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ))
      ],
    ));
  }
}
