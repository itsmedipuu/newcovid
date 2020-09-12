import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  var dateTime;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    dateTime = DateFormat.yMMMd().format(DateTime.parse(data['dateTime']));
    //formatted in M, K for World data
    var fWInfected = NumberFormat.compactCurrency(
      decimalDigits: 5,
      symbol: '',
    ).format(data['winfected']);
    var fWActive = NumberFormat.compactCurrency(
      decimalDigits: 5,
      symbol: '',
    ).format(data['wactive']);
    var fWRecovered = NumberFormat.compactCurrency(
      decimalDigits: 5,
      symbol: '',
    ).format(data['wrecovered']);
    var fWDeath = NumberFormat.compactCurrency(
      decimalDigits: 5,
      symbol: '',
    ).format(data['wdeath']);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.purple[300],
            ),
            Container(
              height: context.percentHeight * 85,
              padding: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60)),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.amber,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/virus.svg',
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Covid-19 Stats',
                            style: TextStyle(
                              color: Colors.pink[700],
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          SvgPicture.asset(
                            'assets/virus.svg',
                            height: 30,
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //World Stats Here

                  Card(
                    elevation: 5,
                    color: Colors.grey,
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text(
                        'World',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: CardShow(
                                text: 'Infected',
                                value: fWInfected,
                                svgImg: 'total',
                                bg: Colors.cyan[300],
                                textColor: Colors.cyan[900])),
                        Expanded(
                            child: CardShow(
                                text: 'Active',
                                value: fWActive,
                                svgImg: 'active',
                                bg: Colors.orange[300],
                                textColor: Colors.orange[900])),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: CardShow(
                                text: 'Recovered',
                                value: fWRecovered,
                                svgImg: 'recovered',
                                bg: Colors.green[300],
                                textColor: Colors.green[900])),
                        Expanded(
                            child: CardShow(
                                text: 'Death',
                                value: fWDeath,
                                svgImg: 'death',
                                bg: Colors.red[300],
                                textColor: Colors.red[900])),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 5,
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    color: Colors.grey,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text(
                        'Nepal',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: CardShow(
                                text: 'Infected',
                                value: data['infected'].toString(),
                                svgImg: 'total',
                                bg: Colors.cyan[300],
                                textColor: Colors.cyan[900])),
                        Expanded(
                            child: CardShow(
                                text: 'Active',
                                value: data['active'].toString(),
                                svgImg: 'active',
                                bg: Colors.orange[300],
                                textColor: Colors.orange[900])),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: CardShow(
                                text: 'Recovered',
                                value: data['recovered'].toString(),
                                svgImg: 'recovered',
                                bg: Colors.green[300],
                                textColor: Colors.green[900])),
                        Expanded(
                            child: CardShow(
                                text: 'Death',
                                value: data['death'].toString(),
                                svgImg: 'death',
                                bg: Colors.red[300],
                                textColor: Colors.red[900])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Updated at: $dateTime',
                    style: TextStyle(color: Colors.white),
                  ).px8().objectCenterRight(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Developed By: ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontStyle: FontStyle.italic)),
                      Text('Dipesh ',
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                    ],
                  ).wFull(context),
                ],
              ).wFull(context),
            ),
          ],
        ),
      ),
    );
  }
}

class CardShow extends StatelessWidget {
  final String text;
  final String value;
  final String svgImg;
  final Color bg;
  final Color textColor;
  const CardShow({
    this.text,
    this.value,
    this.svgImg,
    this.bg,
    this.textColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/$svgImg.svg', height: 28, width: 28)
                  .objectCenterLeft(),
              SizedBox(
                width: 10,
              ),
              Text(this.value,
                      style: TextStyle(
                          fontSize: 25,
                          color: textColor,
                          fontWeight: FontWeight.bold))
                  .centered(),
            ],
          ),
          Text(
            this.text,
            style: TextStyle(fontSize: 20, color: textColor),
          ).objectCenterRight().px8(),
        ],
      ),
    ).opacity75();
  }
}
