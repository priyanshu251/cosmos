import '../services/networking.dart';

const apiKey = '237go3yWSmfxSH7slPZB2k10kcXmmULSvcc8AHuc';

class APODModel {
  Future<dynamic> getCurrentAPOD(String currentDate) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$currentDate');
    var apodData = await networkHelper.getData();
    return apodData;
  }
}
