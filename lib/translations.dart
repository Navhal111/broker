import 'package:get/get.dart';

class MyTranslations extends Translations {

  static Map<String, String> en = {
    "comingSoon": "Coming Soon",
    "Explore": "Explore",
    "Favorite": "Favorite",
    "Trips": "Trips",
    "Inbox": "Inbox",
    "Profile": "Profile",
    "Where": "Where?",
    "citySerach": "City, zip code, address, airport or hotel...",
    "currentLocation": "Current Location",
    "losAngeles": "Los Angeles, CA",
    "sanFrancisco": "San Francisco, CA",
    "Boats": "Boats",
    "Cars": "Cars",
    "Stays": "Stays",
    "clearAllFilters": "Clear all filters",
    "tryChangeLocation": "Try changing or removing some of your filters or adjusting your search location.",
    "topHost": "Top host",
    "day": "day",
    "": "",


  };


  static Map<String, String> hi = {};


  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'hi_IN': hi,
  };


}
