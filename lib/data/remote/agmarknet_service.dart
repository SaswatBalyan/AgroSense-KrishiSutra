import 'dart:convert';

import 'package:http/http.dart' as http;

/// Fetches mandi commodity prices from the Agmarknet "Current Daily Price"
/// resource published on data.gov.in.
///
/// Get a free API key at https://data.gov.in/user/register and run the app
/// with:  `--dart-define=AGMARKNET_API_KEY=<your-key>`
class AgmarknetService {
  AgmarknetService({http.Client? client}) : _client = client ?? http.Client();

  static const _resourceId = '9ef84268-d588-465a-a308-a864a43d0070';
  static const _endpoint = 'https://api.data.gov.in/resource/$_resourceId';
  final http.Client _client;

  /// Agmarknet uses its own spellings for common crops ("Soyabean" vs
  /// "Soybean"); map farm-profile names onto them.
  static const _aliases = <String, String>{
    'soybean': 'Soyabean',
    'blackgram': 'Black Gram',
    'greengram': 'Green Gram',
    'paddy': 'Paddy(Common)',
    'rice': 'Paddy(Common)',
  };

  /// Returns one row per market quoting [commodity], cheapest-first by modal
  /// price. Returns an empty list when no key is configured, nothing matches,
  /// or the request fails — callers keep showing cached data in that case.
  Future<List<AgmarknetPrice>> fetchPricesForCommodity(
    String commodity,
  ) async {
    const apiKey = String.fromEnvironment('AGMARKNET_API_KEY');
    final query = commodity.trim();
    if (apiKey.isEmpty || query.isEmpty) return [];

    // Candidate spellings: as-given first, then the Agmarknet alias.
    final candidates = <String>[query];
    final alias = _aliases[query.replaceAll(' ', '').toLowerCase()];
    if (alias != null) candidates.add(alias);

    try {
      for (final candidate in candidates) {
        final prices = await _fetchExact(candidate, apiKey);
        if (prices.isNotEmpty) return prices;
      }

      // Exact match failed everywhere — fall back to free-text search and
      // keep records whose commodity name contains the query loosely.
      for (final candidate in candidates) {
        final prices = await _fetchLoose(candidate, apiKey);
        if (prices.isNotEmpty) return prices;
      }
      return [];
    } on Exception {
      return [];
    }
  }

  Future<List<AgmarknetPrice>> _fetchExact(
    String commodity,
    String apiKey,
  ) async {
    final uri = Uri.parse(_endpoint).replace(queryParameters: {
      'api-key': apiKey,
      'format': 'json',
      'limit': '200',
      'filters[commodity]': commodity,
    });
    return _parseRecords(await _getBody(uri), expectedCommodity: commodity);
  }

  Future<List<AgmarknetPrice>> _fetchLoose(
    String commodity,
    String apiKey,
  ) async {
    final uri = Uri.parse(_endpoint).replace(queryParameters: {
      'api-key': apiKey,
      'format': 'json',
      'limit': '200',
      'q': commodity,
    });
    return _parseRecords(await _getBody(uri), expectedCommodity: commodity);
  }

  Future<String?> _getBody(Uri uri) async {
    final response = await _client.get(uri).timeout(const Duration(seconds: 15));
    if (response.statusCode < 200 || response.statusCode >= 300) return null;
    return response.body;
  }

  List<AgmarknetPrice> _parseRecords(
    String? body, {
    required String expectedCommodity,
  }) {
    if (body == null || body.isEmpty) return [];
    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) return [];
    final records = decoded['records'];
    if (records is! List) return [];

    final needle = _skeleton(expectedCommodity);
    final prices = <AgmarknetPrice>[];
    for (final record in records) {
      if (record is! Map<String, dynamic>) continue;
      final market = '${record['market'] ?? ''}'.trim();
      // Loose searches may return unrelated commodities — keep only ones
      // whose name relates to what was asked (vowel-insensitive so that
      // spellings like Soybean/Soyabean match). Records without a commodity
      // field come from exact-filtered queries and are trusted as-is.
      final commoditySkeleton = _skeleton('${record['commodity'] ?? ''}');
      if (needle.isNotEmpty &&
          commoditySkeleton.isNotEmpty &&
          !commoditySkeleton.contains(needle)) {
        continue;
      }

      final price = int.tryParse(
        '${record['modal_price'] ?? ''}'.replaceAll(',', ''),
      );
      if (price == null || price <= 0 || market.isEmpty) continue;

      prices.add(AgmarknetPrice(mandi: market, pricePerQuintal: price));
    }

    prices.sort((a, b) => a.pricePerQuintal.compareTo(b.pricePerQuintal));
    return prices;
  }

  /// Vowel-insensitive form used to match Agmarknet's commodity spellings
  /// against farm-profile names ("Soybean" and "Soyabean" both -> "sybn").
  String _skeleton(String input) =>
      input.toLowerCase().replaceAll(RegExp('[aeiou ]'), '');
}

class AgmarknetPrice {
  const AgmarknetPrice({required this.mandi, required this.pricePerQuintal});

  final String mandi;
  final int pricePerQuintal;
}
