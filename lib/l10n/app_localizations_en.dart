// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Krishi-Sutra';

  @override
  String get dashboard => 'Home';

  @override
  String get waterCompass => 'Water';

  @override
  String get pocketScientist => 'Scientist';

  @override
  String get marketplace => 'Market';

  @override
  String get roadmap => 'Roadmap';

  @override
  String get assistant => 'Ask agronomist';

  @override
  String get chooseLanguage => 'Choose your language';

  @override
  String get languageHint =>
      'Voice and screens will follow this pick. You can change it later.';

  @override
  String get continueLabel => 'Continue';

  @override
  String get farmProfile => 'Your farm';

  @override
  String get farmName => 'Farm name';

  @override
  String get location => 'Village or taluka';

  @override
  String get farmSize => 'Size (hectares)';

  @override
  String get crops => 'Main crop';

  @override
  String get saveAndGo => 'Open dashboard';

  @override
  String greeting(String name) {
    return 'Namaste, $name';
  }

  @override
  String get lastUpdated => 'Cached';

  @override
  String get weather => 'Field weather';

  @override
  String get weatherNoData => 'No data yet — sync to fetch';

  @override
  String get groundwater => 'Groundwater';

  @override
  String get marketPrices => 'Mandi nearby';

  @override
  String get cropRecs => 'This week';

  @override
  String get seeRoadmap => 'Zero-to-harvest';

  @override
  String get askAssistant => 'Ask in your language';

  @override
  String get blueZone => 'Blue zone, better yield';

  @override
  String get redZone => 'Red zone, thin aquifer';

  @override
  String get markBorewell => 'Mark borewell';

  @override
  String get borewellMarked =>
      'Pin set. Rating uses the overlay under this point.';

  @override
  String get captureLeaf => 'Photograph a leaf';

  @override
  String get captureHint =>
      'Hold one leaf against soil or sky. Works without signal.';

  @override
  String get runScan => 'Scan leaf';

  @override
  String get diagnosis => 'Yellow mosaic, early';

  @override
  String get remedy =>
      'Rogue the infected plants this morning. Spray neem at dusk. Recheck in 3 days.';

  @override
  String get offlineVision =>
      'On-device model pending. This result is a demo shell.';

  @override
  String get searchInputs => 'Search seed, drip, cake';

  @override
  String get addToBag => 'Ask seller';

  @override
  String get productDetail => 'Product';

  @override
  String get thisWeek => 'This week on the farm';

  @override
  String get soilSeason => 'Black soil, Kharif, Sinnar';

  @override
  String get typeMessage => 'Ask about water, pest, price';

  @override
  String get offlineReady =>
      'Cached. Refreshes when the phone finds a network.';

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
  String get humidity => 'Humidity';

  @override
  String get rain => 'Rain odds';

  @override
  String get depth => 'Water table';

  @override
  String get marketNoData => 'No prices yet — sync to fetch';

  @override
  String get roadmapEmpty =>
      'Your crop plan will appear here once your farm profile is saved.';
}
