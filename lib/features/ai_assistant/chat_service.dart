import 'dart:convert';

import 'package:http/http.dart' as http;

class GroqChatService {
  GroqChatService({http.Client? client}) : _client = client ?? http.Client();

  static const _endpoint = 'https://api.groq.com/openai/v1/chat/completions';
  static const _model = 'llama-3.1-8b-instant';
  final http.Client _client;

  Future<String?> ask(String message) async {
    const apiKey = String.fromEnvironment('GROQ_API_KEY');
    if (apiKey.isEmpty) return null;

    try {
      final response = await _client
          .post(
            Uri.parse(_endpoint),
            headers: {
              'Authorization': 'Bearer $apiKey',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'model': _model,
              'temperature': 0.2,
              'messages': [
                {
                  'role': 'system',
                  'content':
                      'You are Krishi-Sutra, an agriculture advisor for Indian farmers. Answer in the user\'s language. Be specific about crops, soil, and local conditions. Keep answers practical and concise.',
                },
                {'role': 'user', 'content': message},
              ],
            }),
          )
          .timeout(const Duration(seconds: 20));
      if (response.statusCode < 200 || response.statusCode >= 300) return null;

      final body = jsonDecode(response.body);
      final content = body is Map<String, dynamic>
          ? body['choices'] is List && (body['choices'] as List).isNotEmpty
                ? (body['choices'][0] as Map<String, dynamic>)['message']
                          is Map<String, dynamic>
                      ? ((body['choices'][0] as Map<String, dynamic>)['message']
                                as Map<String, dynamic>)['content']
                            as String?
                      : null
                : null
          : null;
      return content?.trim().isEmpty == true ? null : content?.trim();
    } on Exception {
      return null;
    }
  }
}
