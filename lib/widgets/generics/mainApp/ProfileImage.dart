import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileImage extends StatefulWidget {
  final String name;
  final String idNumber;
  const ProfileImage({Key key, this.name, this.idNumber}) : super(key: key);
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File _image;

  void PickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, boxShadow: <BoxShadow>[
                BoxShadow(
                    color: colorNavBarButtonDisable.withOpacity(0.8),
                    blurRadius: 22,
                    offset: Offset(0.0, 0.0))
              ]),
              child: CircleAvatar(
                //backgroundColor: Colors.grey,
                radius: (MediaQuery.of(context).size.width * 0.33) / 2,
                child: CircleAvatar(
                  radius: (MediaQuery.of(context).size.width * 0.33) / 2,
                  backgroundImage: _image != null
                      ? FileImage(_image)
                      : AssetImage('images/profileDefault.png'),
                ),
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.width * 0.33) + 10,
              width: (MediaQuery.of(context).size.width * 0.33) + 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      PickImage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color:
                                    colorNavBarButtonDisable.withOpacity(0.8),
                                blurRadius: 3,
                                offset: Offset(0.0, 0.0))
                          ]),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          color: colorNavBarButtonDisable,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Center(
          child: Column(
            children: [
              Text(
                widget.name,
                style: TextStyle(
                    color: colorAppTextDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: fontApp),
              ),
              Text(
                widget.idNumber,
                style: TextStyle(
                    color: colorAppTextLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFamily: fontApp),
              )
            ],
          ),
        )
      ],
    );
  }
}
