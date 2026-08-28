import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('hi'),
    Locale('mr'),
    Locale('ta'),
    Locale('te'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Krishi-Sutra'**
  String get appTitle;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get dashboard;

  /// No description provided for @waterCompass.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get waterCompass;

  /// No description provided for @pocketScientist.
  ///
  /// In en, this message translates to:
  /// **'Scientist'**
  String get pocketScientist;

  /// No description provided for @marketplace.
  ///
  /// In en, this message translates to:
  /// **'Market'**
  String get marketplace;

  /// No description provided for @roadmap.
  ///
  /// In en, this message translates to:
  /// **'Roadmap'**
  String get roadmap;

  /// No description provided for @assistant.
  ///
  /// In en, this message translates to:
  /// **'Ask agronomist'**
  String get assistant;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get chooseLanguage;

  /// No description provided for @languageHint.
  ///
  /// In en, this message translates to:
  /// **'Voice and screens will follow this pick. You can change it later.'**
  String get languageHint;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @farmProfile.
  ///
  /// In en, this message translates to:
  /// **'Your farm'**
  String get farmProfile;

  /// No description provided for @farmName.
  ///
  /// In en, this message translates to:
  /// **'Farm name'**
  String get farmName;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Village or taluka'**
  String get location;

  /// No description provided for @farmSize.
  ///
  /// In en, this message translates to:
  /// **'Size (hectares)'**
  String get farmSize;

  /// No description provided for @crops.
  ///
  /// In en, this message translates to:
  /// **'Main crop'**
  String get crops;

  /// No description provided for @saveAndGo.
  ///
  /// In en, this message translates to:
  /// **'Open dashboard'**
  String get saveAndGo;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Namaste, {name}'**
  String greeting(String name);

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Cached'**
  String get lastUpdated;

  /// No description provided for @weather.
  ///
  /// In en, this message translates to:
  /// **'Field weather'**
  String get weather;

  /// No description provided for @weatherNoData.
  ///
  /// In en, this message translates to:
  /// **'No data yet — sync to fetch'**
  String get weatherNoData;

  /// No description provided for @groundwater.
  ///
  /// In en, this message translates to:
  /// **'Groundwater'**
  String get groundwater;

  /// No description provided for @marketPrices.
  ///
  /// In en, this message translates to:
  /// **'Mandi nearby'**
  String get marketPrices;

  /// No description provided for @cropRecs.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get cropRecs;

  /// No description provided for @seeRoadmap.
  ///
  /// In en, this message translates to:
  /// **'Zero-to-harvest'**
  String get seeRoadmap;

  /// No description provided for @askAssistant.
  ///
  /// In en, this message translates to:
  /// **'Ask in your language'**
  String get askAssistant;

  /// No description provided for @blueZone.
  ///
  /// In en, this message translates to:
  /// **'Blue zone, better yield'**
  String get blueZone;

  /// No description provided for @redZone.
  ///
  /// In en, this message translates to:
  /// **'Red zone, thin aquifer'**
  String get redZone;

  /// No description provided for @markBorewell.
  ///
  /// In en, this message translates to:
  /// **'Mark borewell'**
  String get markBorewell;

  /// No description provided for @borewellMarked.
  ///
  /// In en, this message translates to:
  /// **'Pin set. Rating uses the overlay under this point.'**
  String get borewellMarked;

  /// No description provided for @captureLeaf.
  ///
  /// In en, this message translates to:
  /// **'Photograph a leaf'**
  String get captureLeaf;

  /// No description provided for @captureHint.
  ///
  /// In en, this message translates to:
  /// **'Hold one leaf against soil or sky. Works without signal.'**
  String get captureHint;

  /// No description provided for @runScan.
  ///
  /// In en, this message translates to:
  /// **'Scan leaf'**
  String get runScan;

  /// No description provided for @diagnosis.
  ///
  /// In en, this message translates to:
  /// **'Yellow mosaic, early'**
  String get diagnosis;

  /// No description provided for @remedy.
  ///
  /// In en, this message translates to:
  /// **'Rogue the infected plants this morning. Spray neem at dusk. Recheck in 3 days.'**
  String get remedy;

  /// No description provided for @offlineVision.
  ///
  /// In en, this message translates to:
  /// **'On-device model pending. This result is a demo shell.'**
  String get offlineVision;

  /// No description provided for @searchInputs.
  ///
  /// In en, this message translates to:
  /// **'Search seed, drip, cake'**
  String get searchInputs;

  /// No description provided for @addToBag.
  ///
  /// In en, this message translates to:
  /// **'Ask seller'**
  String get addToBag;

  /// No description provided for @productDetail.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get productDetail;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week on the farm'**
  String get thisWeek;

  /// No description provided for @soilSeason.
  ///
  /// In en, this message translates to:
  /// **'Black soil, Kharif, Sinnar'**
  String get soilSeason;

  /// No description provided for @typeMessage.
  ///
  /// In en, this message translates to:
  /// **'Ask about water, pest, price'**
  String get typeMessage;

  /// No description provided for @offlineReady.
  ///
  /// In en, this message translates to:
  /// **'Cached. Refreshes when the phone finds a network.'**
  String get offlineReady;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @hindi.
  ///
  /// In en, this message translates to:
  /// **'हिन्दी'**
  String get hindi;

  /// No description provided for @bengali.
  ///
  /// In en, this message translates to:
  /// **'বাংলা'**
  String get bengali;

  /// No description provided for @tamil.
  ///
  /// In en, this message translates to:
  /// **'தமிழ்'**
  String get tamil;

  /// No description provided for @telugu.
  ///
  /// In en, this message translates to:
  /// **'తెలుగు'**
  String get telugu;

  /// No description provided for @marathi.
  ///
  /// In en, this message translates to:
  /// **'मराठी'**
  String get marathi;

  /// No description provided for @humidity.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get humidity;

  /// No description provided for @rain.
  ///
  /// In en, this message translates to:
  /// **'Rain odds'**
  String get rain;

  /// No description provided for @depth.
  ///
  /// In en, this message translates to:
  /// **'Water table'**
  String get depth;

  /// No description provided for @marketNoData.
  ///
  /// In en, this message translates to:
  /// **'No prices yet — sync to fetch'**
  String get marketNoData;

  /// No description provided for @roadmapEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your crop plan will appear here once your farm profile is saved.'**
  String get roadmapEmpty;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'bn',
    'en',
    'hi',
    'mr',
    'ta',
    'te',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'mr':
      return AppLocalizationsMr();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
