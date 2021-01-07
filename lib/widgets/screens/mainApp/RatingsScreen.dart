import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/constants/UtilsText.dart';
import 'package:GoClassUnibe/models/RatingsModel.dart';
import 'package:GoClassUnibe/models/RegistrationModel.dart';
import 'package:GoClassUnibe/providers/PeriodProvider.dart';
import 'package:GoClassUnibe/providers/RatingProvider.dart';
import 'package:GoClassUnibe/providers/RegistrationProvider.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/LoadingCircle.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/Modal.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/RecordScreen.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class RatingsScreen extends StatefulWidget {
  @override
  _RatingsScreenState createState() => _RatingsScreenState();
}

final double _pi = 3.1415926535897932;

PageController _pageController = new PageController();

class _RatingsScreenState extends State<RatingsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorAppBackground,
        body: PageView(
          controller: _pageController,
          physics: BouncingScrollPhysics(),
          children: [
            _ratingsPage1(context),
            _ratingsPage2(),
          ],
        ),
      ),
    );
  }

  Widget _ratingsPage1(BuildContext context) {
    final periodprovider = Provider.of<PeriodProvider>(context);
    final ratingProvider = Provider.of<RatingProvider>(context);
    final registrationProvider = Provider.of<RegistrationProvider>(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          padding: EdgeInsets.only(
              top: titlePaddingTop(context), left: 16, right: 16, bottom: 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BigTitle(
              title: "Calificaciones",
            ),
            (registrationProvider.getRegistrationList().length == 0 &&
                    periodprovider.getPeriodlist().length == 0 &&
                    ratingProvider.getRatings().length == 0)
                ? LoadingCircle(
                    loadingText: 'Cargando calificaciones...',
                  )
                : RatingsBody(
                    registrationList:
                        registrationProvider.getRegistrationList(),
                  ),
          ]),
        ),
      ],
    );
  }

  Widget _ratingsPage2() {
    return RecordScreen();
  }
}

class RatingsBody extends StatelessWidget {
  final List<Registration> registrationList;
  const RatingsBody({Key key, this.registrationList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final periodprovider = Provider.of<PeriodProvider>(context);
    final ratingProvider = Provider.of<RatingProvider>(context);
    List<int> counters = [];
    if (periodprovider.getCurrentPeriod().length > 0 &&
        ratingProvider.getRatings().length > 0) {
      for (var i = 0, len = periodprovider.getCurrentPeriod().length;
          i < len;
          ++i) {
        int count = 0;
        for (var j = 0, len = ratingProvider.getRatings().length;
            j < len;
            ++j) {
          if (periodprovider.getCurrentPeriod()[i].periodId ==
              ratingProvider.getRatings()[j].periodId) {
            count++;
          }
        }
        counters.add(count);
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CategoryText(title: 'carrera'),
      SizedBox(
        height: 16,
      ),
      ListView.builder(
          shrinkWrap: true,
          itemCount: registrationList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  CategoryText(title: registrationList[index].career),
                  SizedBox(
                    height: 16,
                  ),
                  (periodprovider.getCurrentPeriod().length == 0)
                      ? LoadingCircle(loadingText: 'Cargando materias...')
                      : MainCard(
                          childCard: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, subIndex) {
                              List<Rating> rating = [];
                              for (var j = 0,
                                      len = ratingProvider.getRatings().length;
                                  j < len;
                                  ++j) {
                                if (periodprovider
                                        .getCurrentPeriod()[index]
                                        .periodId ==
                                    ratingProvider.getRatings()[j].periodId) {
                                  rating.add(ratingProvider.getRatings()[j]);
                                }
                              }

                              return SignaturesItem(
                                  finalRating: rating[subIndex].finalRating,
                                  color: constantsListColors[subIndex],
                                  stateSignature:
                                      rating[subIndex].stateSignature,
                                  onTap: () {
                                    showModal(
                                      context,
                                      toSentence(
                                          rating[subIndex].signatureName),
                                      rating[subIndex].ap1.toString(),
                                      rating[subIndex].ap2.toString(),
                                      rating[subIndex].ap3.toString(),
                                      rating[subIndex].finalRating.toString(),
                                      rating[subIndex].in1.toString(),
                                      rating[subIndex].in2.toString(),
                                      rating[subIndex].in3.toString(),
                                      rating[subIndex].finalIn.toString(),
                                      rating[subIndex].stateSignature,
                                    );
                                  },
                                  title: rating[subIndex].signatureName);
                            },
                            itemCount: counters[index],
                            separatorBuilder: (context, subIndex) => Divider(
                              color: colorAppTextLight.withOpacity(0.5),
                            ),
                          ),
                        ),
                ]);
          }),
      SizedBox(
        height: 24,
      ),
      _bottonToRecordScreen(),
      SizedBox(
        height: 32,
      ),
    ]);
  }

  Widget _bottonToRecordScreen() {
    return Container(
      child: Center(
        child: InkWell(
            onTap: () {
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 500), curve: Curves.easeOut);
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Ver Récord académico",
                style: TextStyle(
                    color: colorAppGreen,
                    fontFamily: fontApp,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Ionicons.arrow_forward_outline,
                color: colorAppGreen,
              )
            ])),
      ),
    );
  }
}

class SignaturesItem extends StatelessWidget {
  final double finalRating;
  final Color color;
  final String title;
  final String stateSignature;
  final VoidCallback onTap;
  const SignaturesItem({
    Key key,
    @required this.color,
    @required this.title,
    @required this.finalRating,
    @required this.stateSignature,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(children: [
          CircleAvatar(
            backgroundColor: color,
            radius: (MediaQuery.of(context).size.width * 0.11) / 2,
            child: Transform.rotate(
              angle: -_pi / 10,
              child: Container(
                child: Text(title[0],
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: fontApp,
                        color: Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //title,
                toSentence(title),
                style: TextStyle(
                    fontFamily: fontApp,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorAppTextDark),
              ),
              Text(
                toSentence(stateSignature),
                style: TextStyle(
                    fontFamily: fontApp,
                    fontSize: 16,
                    color: colorAppTextLight),
              )
            ],
          )),
          SizedBox(
            width: 16,
          ),
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: stateSignatureDecoration(stateSignature)),
              child: Text(
                finalRating.toString(),
                style: TextStyle(
                    color: stateSignatureText(stateSignature),
                    fontFamily: fontApp,
                    fontSize: 18),
              )),
        ]),
      ),
    );
  }
}
