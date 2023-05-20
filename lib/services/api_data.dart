import 'dart:ffi';

import 'package:flutter/material.dart';

import '../services/networking.dart';

const apodApiKey = '237go3yWSmfxSH7slPZB2k10kcXmmULSvcc8AHuc';
const planetApiKey = 'UIX6ZMpXVwif5cXhV8FvTA==7cAEkPUeT1WVLptY';

class APODModel {
  Future<dynamic> getCurrentAPOD(String currentDate) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.nasa.gov/planetary/apod?api_key=$apodApiKey&date=$currentDate',
        '');
    var apodData = await networkHelper.getData();
    return apodData;
  }

  Future<dynamic> getPlanetData(double minTemp, double maxTemp) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.api-ninjas.com/v1/planets?min_temperature=$minTemp&max_temperature=$maxTemp',
        planetApiKey);
    var planetData = await networkHelper.getPlanetData();
    return planetData;
  }

  // Future<dynamic> getPlanetDataLength(double temp) async {
  //   NetworkHelper networkHelper = NetworkHelper(
  //       'https://api.api-ninjas.com/v1/planets?min_temperature=$temp',
  //       planetApiKey);
  //   var planetDataLength = await networkHelper.getPlanetDataLength();
  //   return planetDataLength;
  // }
}
