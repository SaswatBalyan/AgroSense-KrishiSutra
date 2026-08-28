// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'कृषि-सूत्र';

  @override
  String get dashboard => 'घर';

  @override
  String get waterCompass => 'जल';

  @override
  String get pocketScientist => 'वैज्ञानिक';

  @override
  String get marketplace => 'बाज़ार';

  @override
  String get roadmap => 'रोडमैप';

  @override
  String get assistant => 'सलाह पूछें';

  @override
  String get chooseLanguage => 'अपनी भाषा चुनें';

  @override
  String get languageHint =>
      'आवाज़ और स्क्रीन इसी भाषा में चलेंगी। बाद में बदल सकते हैं।';

  @override
  String get continueLabel => 'आगे बढ़ें';

  @override
  String get farmProfile => 'आपका खेत';

  @override
  String get farmName => 'खेत का नाम';

  @override
  String get location => 'गाँव या तालुका';

  @override
  String get farmSize => 'क्षेत्र (हेक्टेयर)';

  @override
  String get crops => 'मुख्य फसल';

  @override
  String get saveAndGo => 'डैशबोर्ड खोलें';

  @override
  String greeting(String name) {
    return 'नमस्ते, $name';
  }

  @override
  String get lastUpdated => 'कैश';

  @override
  String get weather => 'मौसम';

  @override
  String get weatherNoData => 'अभी कोई डेटा नहीं — अपडेट के लिए सिंक करें';

  @override
  String get groundwater => 'भूजल';

  @override
  String get marketPrices => 'पास की मंडी';

  @override
  String get cropRecs => 'इस सप्ताह';

  @override
  String get seeRoadmap => 'फसल कैलेंडर';

  @override
  String get askAssistant => 'अपनी भाषा में पूछें';

  @override
  String get blueZone => 'नीला क्षेत्र, बेहतर जल';

  @override
  String get redZone => 'लाल क्षेत्र, पतला जलभृत';

  @override
  String get markBorewell => 'बोरवेल चिह्नित करें';

  @override
  String get borewellMarked => 'पिन लगा। नीचे के नक्शे से रेटिंग मिलेगी।';

  @override
  String get captureLeaf => 'पत्ती की तस्वीर';

  @override
  String get captureHint =>
      'एक पत्ती मिट्टी या आसमान के सामने रखें। बिना नेट चलता है।';

  @override
  String get runScan => 'पत्ती जाँचें';

  @override
  String get diagnosis => 'पीला मोजेक, शुरुआती';

  @override
  String get remedy =>
      'संक्रमित पौधे आज सुबह निकालें। शाम को नीम छिड़कें। तीन दिन बाद फिर देखें।';

  @override
  String get offlineVision =>
      'डिवाइस मॉडल बाद में जुड़ेगा। यह डेमो स्क्रीन है।';

  @override
  String get searchInputs => 'बीज, ड्रिप, खली खोजें';

  @override
  String get addToBag => 'विक्रेता से पूछें';

  @override
  String get productDetail => 'उत्पाद';

  @override
  String get thisWeek => 'इस सप्ताह खेत पर';

  @override
  String get soilSeason => 'काली मिट्टी, खरीफ, सिन्नर';

  @override
  String get typeMessage => 'पानी, कीट, भाव पूछें';

  @override
  String get offlineReady => 'कैश से। नेट आने पर ताज़ा होगा।';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिन्दी';

  @override
  String get bengali => 'বাংলা';

  @override
  String get tamil => 'தமிழ்';

  @override
  String get telugu => 'తెలుగు';

  @override
  String get marathi => 'मराठी';

  @override
  String get humidity => 'नमी';

  @override
  String get rain => 'बारिश की संभावना';

  @override
  String get depth => 'जल स्तर';

  @override
  String get marketNoData => 'अभी कोई कीमत नहीं — अपडेट के लिए सिंक करें';

  @override
  String get roadmapEmpty =>
      'आपकी फसल योजना यहाँ दिखाई देगी जब आपकी फार्म प्रोफ़ाइल सहेजी जाएगी।';
}
