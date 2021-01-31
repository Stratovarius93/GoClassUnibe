import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/constants/UtilsText.dart';
import 'package:GoClassUnibe/providers/PeriodProvider.dart';
import 'package:GoClassUnibe/providers/RatingProvider.dart';
import 'package:GoClassUnibe/providers/ScheduleProvider.dart';
import 'package:GoClassUnibe/providers/StudentProvider.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/LoadingCircle.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard2.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/Modal.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/Card1Dashboard.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scroll_glow_color/scroll_glow_color.dart';
import 'package:GoClassUnibe/models/RatingsModel.dart';
import 'package:rive/rive.dart';

class DasshboardScreen extends StatefulWidget {
  @override
  _DasshboardScreenState createState() => _DasshboardScreenState();
}

int count = 0;

class _DasshboardScreenState extends State<DasshboardScreen> {
  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    final scheduleProvider = Provider.of<ScheduleProvider>(context);
    final periodprovider = Provider.of<PeriodProvider>(context);
    final ratingProvider = Provider.of<RatingProvider>(context);
    if (studentProvider.getStudent() != null) {
      scheduleProvider.setCareer(studentProvider.getStudent().career);
    }
    List<Rating> listIn = [];
    for (var i = 0, len = periodprovider.getCurrentPeriod().length;
        i < len;
        ++i) {
      for (var j = 0, len = ratingProvider.getRatings().length; j < len; ++j) {
        if (periodprovider.getCurrentPeriod()[i].periodId ==
            ratingProvider.getRatings()[j].periodId) {
          listIn.add(ratingProvider.getRatings()[j]);
          //print(ratingProvider.getRatings()[j].signatureName);
        }
      }
    }

    return Scaffold(
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
                mainAxisSize: MainAxisSize.min,
                children: (studentProvider.getStudent() == null)
                    ? [
                        _titleHeader(context, 'Loading name...',
                            'Loading last name...', 'Loading career...'),
                        SizedBox(
                          height: 16,
                        ),
                        CategoryText(title: "Clase de hoy"),
                      ]
                    : [
                        _titleHeader(
                            context,
                            studentProvider.getStudent().name,
                            studentProvider.getStudent().lastName,
                            studentProvider.getStudent().career),
                        SizedBox(
                          height: 16,
                        ),
                        CategoryText(title: "Clase de hoy"),
                      ],
              ),
            ),
            CurrentAsignatureCard(scheduleProvider: scheduleProvider),
            finalRive(context, scheduleProvider) ?? Container(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CategoryText(title: "Inasistencias del último período"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: (periodprovider.getCurrentPeriod().length == 0)
                  ? Container(
                      height: 300,
                      child: LoadingCircle(loadingText: 'Cargando materias...'))
                  : MainCard2(
                      childCard: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listIn.length,
                          separatorBuilder: (context, index) => Divider(
                                color: colorAppTextLight.withOpacity(0.5),
                              ),
                          itemBuilder: (context, index) {
                            return _signaturesItem(
                              context,
                              toSentence(listIn[index].signatureName),
                              _totalAbsencesToString(listIn[index].finalIn),
                              constantsListColors[index],
                              () {
                                showModalAbsence(
                                    context,
                                    toSentence(listIn[index].signatureName),
                                    listIn[index].in1.toString(),
                                    listIn[index].in2.toString(),
                                    listIn[index].in3.toString(),
                                    listIn[index].finalIn.toString());
                              },
                            );
                            //return Text(absence[index].absence);
                          }),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signaturesItem(BuildContext context, String signature, String absence,
      Color color, VoidCallback onTap) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Text(signature[0],
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
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  signature,
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
                  absence,
                  style: TextStyle(
                    fontFamily: fontApp,
                    color: colorAppTextLight,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _titleHeader(
      BuildContext context, String name, String lastName, String career) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigTitle(
              title: "Hola, " + name,
            ),
            Text(
              career,
              style: TextStyle(
                  fontFamily: fontApp, color: colorAppTextLight, fontSize: 18),
            )
          ],
        ),
        CircleAvatar(
          backgroundColor: colorAppSkyBlue,
          radius: (MediaQuery.of(context).size.width * 0.15) / 2,
          child: Text(
            name[0] + lastName[0],
            style: TextStyle(
              color: Colors.white,
              fontFamily: fontApp,
              fontSize: 32,
            ),
          ),
        )
      ],
    );
  }
}

class CurrentAsignatureCard extends StatelessWidget {
  final ScheduleProvider scheduleProvider;
  const CurrentAsignatureCard({
    Key key,
    @required this.scheduleProvider,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (scheduleProvider.getListFull().length > 0) {
      if (scheduleProvider.getDashboardList().length > 0) {
        return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: scheduleProvider.getDashboardList().map((item) {
              if (item.name != 'Default') {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 16.0, right: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        //showModal(context, "Matetmaticas", "8.1", "8.2", "8.3",
                        //"8.3", "1", "2", "3", "6", "REPROBADO");
                      },
                      child: Card1Dashboard(
                        subject: toSentence(item.name),
                        //color: item.color,
                        teacherName: (item.teacher == null)
                            ? 'No hay docente'
                            : item.teacher,
                        subjectTime:
                            (item.timeStart.toString().padLeft(2, '0') +
                                ':00' +
                                ' - ' +
                                item.timeEnd.toString().padLeft(2, '0') +
                                ':00'),
                        classRoom: item.classRoom,
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }).toList()));
      }
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Container(
          height: 150,
          child: LoadingCircle(
            loadingText: 'Cargando clase...',
          ),
        ),
      );
    }
  }
}

String _totalAbsencesToString(int finalIn) {
  if (finalIn > 0) {
    return '$finalIn inasistencias 😒';
  } else {
    return 'No tienes inasistencias 😀';
  }
}

class MyRiveAnimation extends StatefulWidget {
  @override
  _MyRiveAnimationState createState() => _MyRiveAnimationState();
}

class _MyRiveAnimationState extends State<MyRiveAnimation> {
  final riveFileName = 'images/resting.riv';
  Artboard _artboard;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  // loads a Rive file
  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      // Select an animation by its name
      setState(() => _artboard = file.mainArtboard
        ..addController(
          SimpleAnimation('Untitled 1'),
        ));
    }
  }

  /// Show the rive file, when loaded
  @override
  Widget build(BuildContext context) {
    return _artboard != null
        ? Rive(
            artboard: _artboard,
            fit: BoxFit.cover,
          )
        : Container();
  }
}

Widget finalRive(BuildContext context, ScheduleProvider scheduleProvider) {
  Widget widget;
  if (scheduleProvider.getDashboardList().length > 0) {
    for (var item in scheduleProvider.getDashboardList()) {
      if (item.name == 'Default') {
        count++;
      }
    }
    if (count == 10) {
      widget = Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Container(
            //width: 400,
            height: 200,
            child: MyRiveAnimation(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Text(' No tienes clases hoy,',
                  style: TextStyle(
                      fontFamily: fontApp,
                      color: colorAppSkyBlue,
                      fontSize: 22)),
              Text('descansa 😌',
                  style: TextStyle(
                      fontFamily: fontApp,
                      color: colorAppSkyBlue,
                      fontSize: 22)),
            ]),
          ),
        ]),
      );
    } else {
      widget = Container();
    }
  }

  count = 0;
  return widget;
}
