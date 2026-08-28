import 'package:latlong2/latlong.dart';

class MockFarm {
  const MockFarm({
    required this.name,
    required this.place,
    required this.sizeLabel,
    required this.crop,
    required this.center,
  });

  final String name;
  final String place;
  final String sizeLabel;
  final String crop;
  final LatLng center;
}

class MockMarketRow {
  const MockMarketRow({
    required this.crop,
    required this.mandi,
    required this.priceLabel,
    required this.deltaLabel,
    required this.up,
  });

  final String crop;
  final String mandi;
  final String priceLabel;
  final String deltaLabel;
  final bool up;
}

class MockProduct {
  const MockProduct({
    required this.id,
    required this.name,
    required this.seller,
    required this.priceLabel,
    required this.category,
    required this.detail,
  });

  final String id;
  final String name;
  final String seller;
  final String priceLabel;
  final String category;
  final String detail;
}

class MockTask {
  const MockTask({
    required this.weekLabel,
    required this.title,
    required this.body,
    required this.done,
  });

  final String weekLabel;
  final String title;
  final String body;
  final bool done;
}

class MockData {
  MockData._();

  static const farm = MockFarm(
    name: 'Patil Farm',
    place: 'Sinnar, Nashik',
    sizeLabel: '1.6 ha',
    crop: 'Soybean',
    center: LatLng(19.830, 74.000),
  );

  static const lastUpdated = 'Today, 06:40';

  static const weatherTemp = '31 C';
  static const weatherSky = 'Haze, light wind';
  static const humidity = '54%';
  static const rainChance = '12%';

  static const groundwaterStatus = 'Caution';
  static const groundwaterDepth = '8.4 m';
  static const groundwaterNote = 'Yield drops south of the well path.';

  static const cropRec =
      'Hold soybean. Shift 0.2 ha to pigeon pea if the next dry spell holds.';

  static const marketRows = [
    MockMarketRow(
      crop: 'Soybean',
      mandi: 'Lasalgaon',
      priceLabel: '4,285 /q',
      deltaLabel: '+110',
      up: true,
    ),
    MockMarketRow(
      crop: 'Onion',
      mandi: 'Pimpalgaon',
      priceLabel: '1,640 /q',
      deltaLabel: '-85',
      up: false,
    ),
    MockMarketRow(
      crop: 'Wheat',
      mandi: 'Nashik',
      priceLabel: '2,410 /q',
      deltaLabel: '+35',
      up: true,
    ),
  ];

  static const products = [
    MockProduct(
      id: 'neem',
      name: 'Neem cake 25 kg',
      seller: 'Nashik Agro Mart',
      priceLabel: 'Rs 487',
      category: 'Soil',
      detail:
          'Cold-pressed cake for kharif beds. Mix 80-100 kg per hectare before sowing. Local stock, Sinnar road.',
    ),
    MockProduct(
      id: 'drip',
      name: 'Drip tape 100 m',
      seller: 'Jaldoot Irrigation',
      priceLabel: 'Rs 1,120',
      category: 'Water',
      detail:
          '16 mm tape, 30 cm dripper spacing. Fits a 0.4 ha vegetable strip. Pickup from Ozar.',
    ),
    MockProduct(
      id: 'seed',
      name: 'Soybean JS-335',
      seller: 'District seed farm',
      priceLabel: 'Rs 92 /kg',
      category: 'Seed',
      detail:
          'Certified lot, 2026 kharif. Treat with rhizobium before sowing. 75 kg per hectare.',
    ),
    MockProduct(
      id: 'urea',
      name: 'Urea 45 kg bag',
      seller: 'FPO desk, Sinnar',
      priceLabel: 'Rs 266',
      category: 'Nutrient',
      detail:
          'Cooperative rate this week. Split dose after first irrigation. Carry ID for the subsidy slip.',
    ),
  ];

  static const roadmap = [
    MockTask(
      weekLabel: 'Week 1',
      title: 'Land and seed',
      body: 'Final plough, drainage lines, JS-335 treatment.',
      done: true,
    ),
    MockTask(
      weekLabel: 'Week 2',
      title: 'Sow on residual moisture',
      body: '45 cm rows. Skip the red-zone strip near the south bund.',
      done: true,
    ),
    MockTask(
      weekLabel: 'Week 3',
      title: 'Gap fill and weeding',
      body: 'Hand weed once. Watch for stem fly on young plants.',
      done: false,
    ),
    MockTask(
      weekLabel: 'Week 5',
      title: 'First irrigation gate',
      body: 'Irrigate only if the 8.4 m water table holds and no rain in 4 days.',
      done: false,
    ),
    MockTask(
      weekLabel: 'Week 8',
      title: 'Flowering watch',
      body: 'Scout leaves at dawn. Photograph any yellow mosaic for Pocket Scientist.',
      done: false,
    ),
  ];

  static final blueZone = <LatLng>[
    const LatLng(19.845, 73.985),
    const LatLng(19.845, 74.015),
    const LatLng(19.825, 74.018),
    const LatLng(19.818, 73.988),
  ];

  static final redZone = <LatLng>[
    const LatLng(19.818, 74.005),
    const LatLng(19.820, 74.028),
    const LatLng(19.800, 74.025),
    const LatLng(19.798, 74.002),
  ];
}
