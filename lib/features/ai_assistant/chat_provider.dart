import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/local/chat_dao.dart';
import '../../shared/providers/database_provider.dart';
import 'chat_service.dart';

final chatDaoProvider = Provider<ChatDao>(
  (ref) => ChatDao(ref.watch(databaseProvider)),
);

final chatMessagesProvider = StreamProvider.autoDispose<List<ChatHistoryData>>(
  (ref) => ref.watch(chatDaoProvider).watchMessages(),
);

final groqChatServiceProvider = Provider<GroqChatService>(
  (ref) => GroqChatService(),
);

final sendMessageProvider =
    AsyncNotifierProvider.autoDispose<ChatController, void>(ChatController.new);

class ChatController extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> send(String text) async {
    final message = text.trim();
    if (message.isEmpty || state.isLoading) return;

    state = const AsyncLoading();
    final dao = ref.read(chatDaoProvider);
    await dao.addMessage(role: 'user', message: message, source: 'local');
    final cloudReply = await ref.read(groqChatServiceProvider).ask(message);
    await dao.addMessage(
      role: 'assistant',
      message:
          cloudReply ??
          'I saved your question offline. Connect to the internet to receive a fresh agronomy answer.',
      source: cloudReply == null ? 'offline' : 'groq',
    );
    state = const AsyncData(null);
  }
}
