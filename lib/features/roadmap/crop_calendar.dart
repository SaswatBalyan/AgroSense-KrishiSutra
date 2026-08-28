/// Static week-by-week agronomy calendars used to generate the Zero-to-Harvest
/// roadmap from a farm profile. Templates are intentionally conservative and
/// generic per crop family; they are a planning aid, not a replacement for
/// local agronomist advice.
library;

class CalendarTask {
  const CalendarTask(this.weekLabel, this.title, this.details);

  final String weekLabel;
  final String title;
  final String details;
}

/// Indian cropping seasons.
enum Season { kharif, rabi, zaid }

class CropCalendar {
  CropCalendar._();

  /// Derives the season that is starting "now" for sowing decisions.
  /// Kharif: June-October. Rabi: November-March. Zaid: April-May.
  static Season seasonForMonth(int month) {
    if (month >= 6 && month <= 10) return Season.kharif;
    if (month == 11 || month == 12 || month <= 3) return Season.rabi;
    return Season.zaid;
  }

  static String seasonLabel(Season season) => switch (season) {
        Season.kharif => 'Kharif',
        Season.rabi => 'Rabi',
        Season.zaid => 'Zaid',
      };

  /// Normalizes farm-profile crop names onto calendar keys
  /// ("Soyabean", "soy bean" -> soybean; vowel-insensitive matching).
  static String? _resolveKey(String crop) {
    String skeleton(String input) =>
        input.toLowerCase().replaceAll(RegExp('[^a-z]'), '');
    final query = skeleton(crop);
    if (query.isEmpty) return null;
    for (final key in _calendars.keys) {
      final candidate = skeleton(key);
      if (query.contains(candidate) || candidate.contains(query)) {
        return key;
      }
    }
    // Vowel-insensitive retry ("soyabean" vs "soybean").
    final stripped = query.replaceAll(RegExp('[aeiou]'), '');
    if (stripped.isEmpty) return null;
    for (final key in _calendars.keys) {
      final candidate =
          skeleton(key).replaceAll(RegExp('[aeiou]'), '');
      if (candidate.contains(stripped) || stripped.contains(candidate)) {
        return key;
      }
    }
    return null;
  }

  /// Returns the week-by-week plan for [crop], falling back to the seasonal
  /// generic calendar when the crop is unknown.
  static List<CalendarTask> tasksFor(String crop, Season season) {
    final key = _resolveKey(crop);
    if (key != null) return _calendars[key]!;
    return season == Season.rabi ? _rabiGeneric : _kharifGeneric;
  }

  static bool covers(String crop) => _resolveKey(crop) != null;

  static const Map<String, List<CalendarTask>> _calendars = {
    'soybean': [
      CalendarTask('Week 0', 'Seed treatment',
          'Treat seed with Rhizobium + PSB culture before sowing.'),
      CalendarTask('Week 1', 'Sowing',
          'Sow rows 45 cm apart, 3-5 cm deep, after a good pre-monsoon shower.'),
      CalendarTask('Week 2', 'Gap filling',
          'Fill gaps within 10 days of emergence; keep plant population near 4 lakh/ha.'),
      CalendarTask('Week 3', 'Weeding 1',
          'First hand weeding or inter-culture at 15-20 days after sowing.'),
      CalendarTask('Week 5', 'Weeding 2',
          'Second weeding around 30-35 days; do not injure surface roots.'),
      CalendarTask('Week 6', 'Growth check',
          'Watch for girdle beetle and semilooper; spray only if threshold crossed.'),
      CalendarTask('Week 8', 'Irrigation check',
          'If dry spell at flowering, irrigate once — this protects pod set.'),
      CalendarTask('Week 10', 'Pod stage',
          'Monitor for girdle beetle on pods; avoid excess nitrogen now.'),
      CalendarTask('Week 13', 'Pre-harvest',
          'Stop irrigation; prepare drying floor and threshing arrangements.'),
      CalendarTask('Week 15', 'Harvest',
          'Harvest when 80% pods turn yellow; dry to 10% moisture before storage.'),
    ],
    'cotton': [
      CalendarTask('Week 0', 'Field preparation',
          'Deep ploughing done; apply FYM and basal dose as per soil test.'),
      CalendarTask('Week 1', 'Sowing',
          'Sow certified Bt/hybrid seed at recommended spacing after monsoon onset.'),
      CalendarTask('Week 3', 'Thinning',
          'Thin to one healthy plant per hill 15-20 days after sowing.'),
      CalendarTask('Week 4', 'Weeding 1',
          'First weeding; keep basin weed-free around seedlings.'),
      CalendarTask('Week 7', 'Top dressing',
          'Split nitrogen dose at squaring; irrigate if no rain for 2 weeks.'),
      CalendarTask('Week 9', 'Pest scouting',
          'Start weekly counts of jassids/whitefly and pink bollworm traps.'),
      CalendarTask('Week 12', 'Square & flower drop check',
          'Avoid water stress during flowering; remove damaged squares.'),
      CalendarTask('Week 16', 'First picking',
          'Pick fully burst bolls in dry morning hours; keep lots clean.'),
      CalendarTask('Week 20', 'Second picking',
          'Continue pickings every 15 days; store kapas dry, off the ground.'),
      CalendarTask('Week 24', 'End of season',
          'Uproot and destroy stalks to break pink bollworm cycle.'),
    ],
    'onion': [
      CalendarTask('Week -6', 'Nursery sowing',
          'Raise nursery; 0.4 ha nursery serves 1 ha transplanting.'),
      CalendarTask('Week 0', 'Transplanting',
          'Transplant 6-7 week old seedlings on raised beds at 10x15 cm.'),
      CalendarTask('Week 1', 'Life irrigation',
          'Light irrigation on day 3, then weekly until establishment.'),
      CalendarTask('Week 3', 'Weeding',
          'Hand weed beds; onions compete poorly with early weeds.'),
      CalendarTask('Week 5', 'Top dressing',
          'Apply second nitrogen split and hoe lightly between rows.'),
      CalendarTask('Week 8', 'Bulbing check',
          'Keep soil moist as bulbs swell; avoid excess nitrogen now.'),
      CalendarTask('Week 11', 'Disease watch',
          'Scout for purple blotch and thrips; rotate sprays if needed.'),
      CalendarTask('Week 14', 'Top falling',
          'Stop irrigation when 50% tops fall over; cure bulbs in field 3-5 days.'),
      CalendarTask('Week 16', 'Harvest & cure',
          'Lift, cure with tops on under shade; store only well-cured bulbs.'),
    ],
    'wheat': [
      CalendarTask('Week -1', 'Field preparation',
          'Two harrowings + planking; apply full P/K and half N basally.'),
      CalendarTask('Week 0', 'Sowing',
          'Sow by mid-November, rows 20-22 cm apart, seed rate ~100 kg/ha.'),
      CalendarTask('Week 1', 'Crown root irrigation',
          'First irrigation at 20-21 days (crown root stage) — most critical.'),
      CalendarTask('Week 3', 'Tillering irrigation',
          'Second irrigation at 40-45 days; top-dress remaining nitrogen first.'),
      CalendarTask('Week 5', 'Weed control',
          'Check for Phalaris/wild oats; herbicide window closes soon.'),
      CalendarTask('Week 8', 'Jointing stage',
          'Third irrigation; scout for aphids and yellow rust weekly.'),
      CalendarTask('Week 11', 'Heading & flowering',
          'Do not stress the crop; mildew/rust checks continue weekly.'),
      CalendarTask('Week 13', 'Grain filling',
          'Fourth irrigation; avoid terminal stress for bold grains.'),
      CalendarTask('Week 16', 'Harvest readiness',
          'Grain hard between teeth = ready; arrange combine/threshing early.'),
    ],
    'pigeonpea': [
      CalendarTask('Week 0', 'Sowing',
          'Sow with monsoon onset, rows 60-75 cm apart for medium-duration types.'),
      CalendarTask('Week 3', 'Weeding 1',
          'First weeding at 20 days; keep fields clean through August.'),
      CalendarTask('Week 6', 'Plant protection',
          'Install pheromone traps for pod borer; begin weekly counts.'),
      CalendarTask('Week 9', 'Flowering',
          'Protect from moisture stress; avoid heavy insecticide during bloom hours.'),
      CalendarTask('Week 12', 'Pod formation',
          'Scout pod borers twice weekly; targeted spraying only above threshold.'),
      CalendarTask('Week 17', 'Picking start',
          'Begin green pod picking or wait for grain types to mature.'),
      CalendarTask('Week 20', 'Harvest',
          'Harvest when 80% pods mature; dry and thresh cleanly.'),
    ],
    'maize': [
      CalendarTask('Week 0', 'Sowing',
          'Sow in moist seedbed, 60x20 cm, depth 4-5 cm.'),
      CalendarTask('Week 2', 'Thinning & gap filling',
          'Maintain single plant per hill within the first fortnight.'),
      CalendarTask('Week 3', 'Weeding',
          'Weed at 20-25 days; earthing-up with interculture helps stand.',
          ),
      CalendarTask('Week 5', 'Top dressing',
          'Apply second nitrogen split just before tasseling.'),
      CalendarTask('Week 7', 'Water critical',
          'Never let the crop stress at tasseling-silking; irrigate if needed.'),
      CalendarTask('Week 12', 'Grain fill',
          'Watch for fall armyworm in whorls; treat early infestations.'),
      CalendarTask('Week 16', 'Harvest',
          'Harvest when husks dry and grains hard; shell and dry to 12%.'),
    ],
    'groundnut': [
      CalendarTask('Week 0', 'Sowing',
          'Sow with monsoon onset; gypsum ready for pegging stage.'),
      CalendarTask('Week 3', 'Weeding',
          'Complete weeding before flowering starts.'),
      CalendarTask('Week 5', 'Gypsum application',
          'Apply gypsum at pegging for better pod filling.'),
      CalendarTask('Week 7', 'Earthing up',
          'Cover developing pegs lightly with soil.'),
      CalendarTask('Week 9', 'Disease watch',
          'Check for tikka leaf spot; keep foliage protected till pods fill.'),
      CalendarTask('Week 14', 'Maturity check',
          'Test-dig samples: inner shell darkening means ready.'),
      CalendarTask('Week 15', 'Harvest',
          'Lift, shake off soil and windrow-dry pods downward for 3-4 days.'),
    ],
  };
}

final List<CalendarTask> _kharifGeneric = const [
  CalendarTask('Week 1', 'Sowing',
      'Sow with monsoon onset using certified seed at recommended spacing.'),
  CalendarTask('Week 3', 'Weeding 1',
      'First weeding 15-20 days after sowing.'),
  CalendarTask('Week 6', 'Weeding 2 / top dressing',
      'Second weeding; apply remaining fertilizer as advised.'),
  CalendarTask('Week 9', 'Pest scouting',
      'Weekly pest and disease walk-throughs begin now.'),
  CalendarTask('Week 13', 'Reproductive stage',
      'Protect from moisture stress during flowering/podding.'),
  CalendarTask('Week 17', 'Harvest readiness',
      'Plan harvest, labour and drying space; monitor maturity.'),
];

final List<CalendarTask> _rabiGeneric = const [
  CalendarTask('Week 0', 'Pre-sowing irrigation',
      'Irrigate first, then sow after pre-sowing irrigation with recommended seed rate.'),
  CalendarTask('Week 3', 'Critical irrigation',
      'Crown-root/tillering irrigation is the yield maker — do not miss it.'),
  CalendarTask('Week 5', 'Weed control',
      'Manage weeds early; rabi weeds escape control late.'),
  CalendarTask('Week 8', 'Nutrient top-up',
      'Apply remaining nitrogen with irrigation water as planned.'),
  CalendarTask('Week 11', 'Weather watch',
      'Guard against frost and terminal heat; irrigate evenings if frost risk.'),
  CalendarTask('Week 15', 'Harvest',
      'Harvest at physiological maturity; thresh and store dry.'),
];
