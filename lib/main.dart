import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';
import 'app.dart';
import 'data/remote/background_sync.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(backgroundCallback);
  Workmanager().registerPeriodicTask(
    backgroundSyncTask,
    backgroundSyncTask,
    frequency: const Duration(hours: 6),
    constraints: Constraints(networkType: NetworkType.connected),
  );
  runApp(const ProviderScope(child: KrishiSutraApp()));
}
