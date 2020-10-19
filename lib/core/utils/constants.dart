import 'package:flutter/material.dart';

// api part
const apiKey = "15bb3d38a33e52ad966bf2ca6b5159c0";
const unwantedParams = "minutely,alerts";
const url = "https://api.openweathermap.org/data/2.5";

// widgets part
const kDimTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 15.0);

const kBrightTextStyle = TextStyle(color: Colors.white, fontSize: 15.0);

const kBoldBrightTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);

// database part
const tableName = 'weather_data.db';
const createTableSql = 'CREATE TABLE weather()';