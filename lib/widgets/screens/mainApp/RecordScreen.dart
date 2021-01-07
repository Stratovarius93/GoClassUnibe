import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/constants/UtilsText.dart';
import 'package:GoClassUnibe/models/PeriodModel.dart';
import 'package:GoClassUnibe/models/RatingsModel.dart';
import 'package:GoClassUnibe/providers/PeriodProvider.dart';
import 'package:GoClassUnibe/providers/RatingProvider.dart';
import 'package:GoClassUnibe/providers/RegistrationProvider.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/LoadingCircle.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/Modal.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';

import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:provider/provider.dart';
import 'package:scroll_glow_color/widget/scroll_glow_color.dart';

class RecordScreen extends StatefulWidget {
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final double _pi = 3.1415926535897932;
  //final list2 = List.generate(5, (i) => "Materia $i");
  @override
  Widget build(BuildContext context) {
    final registrationProvider = Provider.of<RegistrationProvider>(context);
    final periodprovider = Provider.of<PeriodProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorAppBackground,
        body: ScrollGlowColor(
          color: colorGlow,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: titlePaddingTop(context),
                    left: 16,
                    right: 16,
                    bottom: 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigTitle(
                        title: "Récord Académico",
                      ),
                      (registrationProvider.getRegistrationList().length == 0 &&
                              periodprovider.getPeriodlist().length == 0)
                          ? LoadingCircle(loadingText: 'Cargando períodos...')
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: [
                                      CategoryText(
                                        title: registrationProvider
                                            .getRegistrationList()[index]
                                            .career,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 16),
                                        child: MainCard(
                                          childCard: _listItems(
                                              registrationProvider
                                                  .getRegistrationList()[index]
                                                  .careerId),
                                        ),
                                      )
                                    ]);
                              },
                              itemCount: registrationProvider
                                  .getRegistrationList()
                                  .length,
                            ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItems(int careerIndex) {
    final periodprovider = Provider.of<PeriodProvider>(context);

    if (periodprovider.getPeriodlist().length > 0) {
      List<Period> list = [];
      for (var i = 0, len = periodprovider.getPeriodlist().length;
          i < len;
          ++i) {
        if (careerIndex == periodprovider.getPeriodlist()[i].careerId) {
          list.add(periodprovider.getPeriodlist()[i]);
        }
      }
      return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: colorAppTextLight,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => ExpansionTile(
          childrenPadding: EdgeInsets.all(0),
          leading: CircleAvatar(
            backgroundColor: constantsListColors[index],
            radius: (MediaQuery.of(context).size.width * 0.11) / 2,
            child: Transform.rotate(
              angle: -_pi / 10,
              child: Container(
                child: Text("P${index + 1}",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: fontApp,
                        color: Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Período ${list[index].periodId}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontApp,
                  color: colorAppTextDark),
            ),
          ),
          subtitle: Text(
            //"$index de 5 materias matriculadas",
            list[index].cycle,
            style: TextStyle(
              fontFamily: fontApp,
              color: colorAppTextLight,
              fontSize: 16,
            ),
          ),
          children: _listSubItem(list[index].periodId, careerIndex),
        ),
        itemCount: list.length,
      );
    } else {
      return LoadingCircle(loadingText: 'Cargando periodos...');
    }
  }

  List<Widget> _listSubItem(int index, int careerIndex) {
    final ratingProvider = Provider.of<RatingProvider>(context);
    List<Rating> list = [];
    if (ratingProvider.getRatings().length > 0) {
      for (var i = 0, len = ratingProvider.getRatings().length; i < len; ++i) {
        if (index == ratingProvider.getRatings()[i].periodId) {
          list.add(ratingProvider.getRatings()[i]);
        }
      }
    }
    return list.map((val) {
      return ListTile(
        onTap: () {
          showModal(context, toSentence(val.signatureName),
              val.ap1.toString(), 
              val.ap2.toString(), 
              val.ap3.toString(),
              val.finalRating.toString(),
              val.in1.toString(), 
              val.in2.toString(), 
              val.in3.toString(), 
              val.finalIn.toString(), 
              val.stateSignature);
        },
        title: Text(
          toSentence(val.signatureName),
          style: TextStyle(
              color: colorAppTextLight, fontSize: 18, fontFamily: fontApp),
        ),
        trailing: Container(
            padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
            decoration: BoxDecoration(
                color: stateSignatureDecoration(val.stateSignature),
                borderRadius: BorderRadius.circular(16.0)),
            child: Text(toSentence(val.stateSignature),
                style: TextStyle(
                    fontFamily: fontApp,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: stateSignatureText(val.stateSignature)))),
      );
    }).toList();
  }
}
