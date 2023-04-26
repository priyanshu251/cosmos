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

  // Future<dynamic> getInfiniteAPOD(int count) async {
  //   NetworkHelper networkHelper = NetworkHelper(
  //       'https://api.nasa.gov/planetary/apod?api_key=$apodApiKey&count=$count');
  //   var apodData = await networkHelper.getData();
  //   return apodData;
  // }
}
