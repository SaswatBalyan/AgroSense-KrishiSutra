import 'dart:async';

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vosk_flutter/vosk_flutter.dart';

/// Offline speech-to-text for the AI assistant, powered by Vosk.
///
/// Models are downloaded once while online (small models, 40-50 MB per
/// language) and cached on-device; recognition itself is fully offline.
/// Hindi model is bundled in assets for instant offline availability.
class VoiceService {
  VoiceService._();

  static final VoiceService instance = VoiceService._();

  /// Vosk small models keyed by app language code. English is the default;
  /// Hindi model is bundled in assets for instant offline availability.
  /// Other languages fall back to network download.
  static const _modelUrls = <String, String>{
    'en': 'https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip',
    'hi': 'assets/models/vosk/vosk-model-small-hi-0.22.zip',
  };

  static const defaultLanguage = 'en';

  final _plugin = VoskFlutterPlugin.instance();
  final _loader = ModelLoader(assetBundle: rootBundle);

  Model? _model;
  Recognizer? _recognizer;
  SpeechService? _speechService;
  StreamSubscription<String>? _resultSub;
  String? _loadedLanguage;

  bool get isListening => _speechService != null;

  /// Maps an app locale code onto a supported Vosk model language.
  static String modelLanguageFor(String localeCode) =>
      _modelUrls.containsKey(localeCode) ? localeCode : defaultLanguage;

  static String modelUrlFor(String language) =>
      _modelUrls[language] ?? _modelUrls[defaultLanguage]!;

  /// Requests mic permission, prepares the model for [localeCode] and starts
  /// listening. [onFinalResult] fires with each completed transcription.
  /// Returns false when permission was denied or setup failed.
  Future<bool> start({
    required String localeCode,
    required void Function(String text) onFinalResult,
  }) async {
    if (isListening) return true;

    final status = await Permission.microphone.request();
    if (!status.isGranted) return false;

    try {
      final language = modelLanguageFor(localeCode);
      await _ensureModel(language);

      _resultSub?.cancel();
      _resultSub = _speechService!.onResult().listen((text) {
        if (text.trim().isNotEmpty) onFinalResult(text.trim());
      });

      await _speechService!.start();
      return true;
    } on PlatformException {
      await stop();
      return false;
    } on Exception {
      await stop();
      return false;
    }
  }

  Future<void> stop() async {
    try {
      await _speechService?.stop();
    } on Exception {
      // ignore — service may already be stopped
    }
    await _resultSub?.cancel();
    _resultSub = null;
    _speechService = null;
  }

  Future<void> _ensureModel(String language) async {
    if (_loadedLanguage == language && _speechService != null) return;

    await stop();
    final modelPath = _modelUrls[language]!.startsWith('assets/')
        ? await _loader.loadFromAssets(_modelUrls[language]!)
        : await _loader.loadFromNetwork(modelUrlFor(language));
    _model = await _plugin.createModel(modelPath);
    _recognizer = await _plugin.createRecognizer(
      model: _model!,
      sampleRate: 16000,
    );
    _speechService =
        await _plugin.initSpeechService(_recognizer!);
    _loadedLanguage = language;
  }
}
