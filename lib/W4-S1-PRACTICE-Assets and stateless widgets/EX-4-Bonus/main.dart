import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Bonus",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Row(
              children: [
                WeatherForecast(
                  day: DayOfWeek.Sun,
                  con: Condition.Sunny,
                  temperatureMax: 12,
                  temperatureMin: 8,
                ),
                SizedBox(
                  width: 10,
                ),
                WeatherForecast(
                  day: DayOfWeek.Mon,
                  con: Condition.Cloudy,
                  temperatureMax: 11,
                  temperatureMin: 4,
                ),
                SizedBox(
                  width: 10,
                ),
                WeatherForecast(
                  day: DayOfWeek.Tue,
                  con: Condition.Rainy,
                  temperatureMax: 7,
                  temperatureMin: 1,
                ),
                SizedBox(
                  width: 10,
                ),
                WeatherForecast(
                  day: DayOfWeek.Wed,
                  con: Condition.Snowy,
                  temperatureMax: 1,
                  temperatureMin: -18,
                ),
                SizedBox(
                  width: 10,
                ),
                WeatherForecast(
                  day: DayOfWeek.Thu,
                  con: Condition.Sunny,
                  temperatureMax: 30,
                  temperatureMin: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                WeatherForecast(
                  day: DayOfWeek.Fri,
                  con: Condition.Cloudy,
                  temperatureMax: 20,
                  temperatureMin: 8,
                ),
                SizedBox(
                  width: 10,
                ),
                WeatherForecast(
                  day: DayOfWeek.Sat,
                  con: Condition.Sunny,
                  temperatureMax: 40,
                  temperatureMin: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class WeatherForecast extends StatelessWidget {
  final DayOfWeek day;
  final Condition con;
  final int temperatureMin;
  final int temperatureMax;

  const WeatherForecast({
    super.key,
    required this.day,
    required this.con,
    required this.temperatureMax,
    required this.temperatureMin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(
            day.name,
            style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
          ),
          const SizedBox(
            height: 10,
          ),
          con.icon,
          const SizedBox(
            height: 10,
          ),
          Text(
            '$temperatureMax°  $temperatureMin°',
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

enum Condition {
  Sunny(Icon(Icons.wb_sunny, color: Colors.yellow)),
  Rainy(Icon(Icons.cloud, color: Colors.blue)),
  Cloudy(Icon(Icons.cloud_queue, color: Colors.grey)),
  Snowy(Icon(Icons.ac_unit, color: Colors.lightBlue));

  final Icon icon;
  const Condition(this.icon);
}

enum DayOfWeek { Sun, Mon, Tue, Wed, Thu, Fri, Sat }
