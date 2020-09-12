import 'package:http/http.dart';
import 'dart:convert';

class CovidData {
  int infected;
  int active;
  int recovered;
  int death;
  String dateTime;

  // CovidData({
  //   this.infected,
  //   this.active,
  //   this.recovered,
  //   this.death,
  //   this.dateTime,
  // });

  Future<void> getData() async {
    Response response = await get('https://nepalcorona.info/api/v1/data/nepal');
    Map data = jsonDecode(response.body);
    infected = data['tested_positive'];
    active = data['in_isolation'];
    recovered = data['recovered'];
    death = data['deaths'];
    dateTime = data['latest_sit_report']['updated_at'];
  }
}

class WorldData {
  int infected;
  int active;
  int recovered;
  int death;

  Future<void> getData() async {
    Response response = await get('https://api.covid19api.com/summary');
    Map data = jsonDecode(response.body);
    infected = data['Global']['TotalConfirmed'];
    recovered = data['Global']['TotalRecovered'];
    death = data['Global']['TotalDeaths'];
    active = infected - recovered - death;
  }
}
