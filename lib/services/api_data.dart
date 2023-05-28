import '../services/networking.dart';

// const APIfixedPart = 'https://api.api-ninjas.com/v1/planets?';
// const APImassPart = 'min_mass=0.000008&max_mass=60&';
// const APIradPart = 'min_radius=0.0009&max_radius=60&';
// const APItempPart = 'min_temperature=39&max_temperature=4050';

const apodApiKey = '237go3yWSmfxSH7slPZB2k10kcXmmULSvcc8AHuc';
const planetAndstarApiKey = 'UIX6ZMpXVwif5cXhV8FvTA==7cAEkPUeT1WVLptY';

class APODModel {
  Future<dynamic> getCurrentAPOD(String currentDate) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.nasa.gov/planetary/apod?api_key=$apodApiKey&date=$currentDate',
        '');
    var apodData = await networkHelper.getData();
    return apodData;
  }

  Future<dynamic> planetDataByName(String planetName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.api-ninjas.com/v1/planets?name=$planetName',
        planetAndstarApiKey);
    var planetDataByName = await networkHelper.getPlanetAndStarData();
    return planetDataByName;
  }

  Future<dynamic> starDataByName(String starName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.api-ninjas.com/v1/stars?name=$starName',
        planetAndstarApiKey);
    var starDataByName = await networkHelper.getPlanetAndStarData();
    return starDataByName;
  }

  Future<dynamic> getPlanetData(
      bool isMassAbled,
      bool isRadAbled,
      bool isTempAbled,
      double minMass,
      double maxMass,
      double minRad,
      double maxRad,
      double minTemp,
      double maxTemp) async {
    if (isMassAbled && isRadAbled && isTempAbled) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.api-ninjas.com/v1/planets?min_mass=$minMass&max_mass=$maxMass&min_radius=$minRad&max_radius=$maxRad&min_temperature=$minTemp&max_temperature=$maxTemp',
          planetAndstarApiKey);
      var planetData = await networkHelper.getPlanetAndStarData();
      return planetData;
    } else if (isMassAbled && isRadAbled) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.api-ninjas.com/v1/planets?min_mass=$minMass&max_mass=$maxMass&min_radius=$minRad&max_radius=$maxRad',
          planetAndstarApiKey);
      var planetData = await networkHelper.getPlanetAndStarData();
      return planetData;
    } else if (isMassAbled && isTempAbled) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.api-ninjas.com/v1/planets?min_mass=$minMass&max_mass=$maxMass&min_temperature=$minTemp&max_temperature=$maxTemp',
          planetAndstarApiKey);
      var planetData = await networkHelper.getPlanetAndStarData();
      return planetData;
    } else if (isRadAbled && isTempAbled) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.api-ninjas.com/v1/planets?&min_radius=$minRad&max_radius=$maxRad&min_temperature=$minTemp&max_temperature=$maxTemp',
          planetAndstarApiKey);
      var planetData = await networkHelper.getPlanetAndStarData();
      return planetData;
    } else if (isMassAbled) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.api-ninjas.com/v1/planets?min_mass=$minMass&max_mass=$maxMass',
          planetAndstarApiKey);
      var planetData = await networkHelper.getPlanetAndStarData();
      return planetData;
    } else if (isRadAbled) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.api-ninjas.com/v1/planets?min_radius=$minRad&max_radius=$maxRad',
          planetAndstarApiKey);
      var planetData = await networkHelper.getPlanetAndStarData();
      return planetData;
    } else if (isTempAbled) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.api-ninjas.com/v1/planets?min_temperature=$minTemp&max_temperature=$maxTemp',
          planetAndstarApiKey);
      var planetData = await networkHelper.getPlanetAndStarData();
      return planetData;
    }
  }

  Future<dynamic> getStarData(
    bool isAppMagAbled,
    bool isAbsMagAbled,
    double minAppMag,
    double maxAppMag,
    double minAbsMag,
    double maxAbsMag,
  ) async {
    if (isAppMagAbled && isAbsMagAbled) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.api-ninjas.com/v1/stars?min_apparent_magnitude=$minAppMag&max_apparent_magnitude=$maxAppMag&min_absolute_magnitude=$minAbsMag&max_absolute_magnitude=$maxAbsMag',
          planetAndstarApiKey);
      var starData = await networkHelper.getPlanetAndStarData();
      return starData;
    } else if (isAppMagAbled) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.api-ninjas.com/v1/stars?min_apparent_magnitude=$minAppMag&max_apparent_magnitude=$maxAppMag',
          planetAndstarApiKey);
      var starData = await networkHelper.getPlanetAndStarData();
      return starData;
    } else if (isAbsMagAbled) {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.api-ninjas.com/v1/stars?min_apparent_magnitude=$minAbsMag&max_apparent_magnitude=$maxAbsMag',
          planetAndstarApiKey);
      var starData = await networkHelper.getPlanetAndStarData();
      return starData;
    }
  }
}
