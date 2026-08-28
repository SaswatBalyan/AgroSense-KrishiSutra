import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../l10n/app_localizations.dart';
import 'chat_provider.dart';
import 'voice_service.dart';

class AiAssistantScreen extends ConsumerStatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  ConsumerState<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends ConsumerState<AiAssistantScreen> {
  final _messageController = TextEditingController();
  bool _listening = false;

  @override
  void dispose() {
    VoiceService.instance.stop();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text;
    if (text.trim().isEmpty) return;
    _messageController.clear();
    await ref.read(sendMessageProvider.notifier).send(text);
  }

  Future<void> _toggleMic() async {
    final localeCode = Localizations.localeOf(context).languageCode;
    if (_listening) {
      await VoiceService.instance.stop();
      setState(() => _listening = false);
      return;
    }

    final started = await VoiceService.instance.start(
      localeCode: localeCode,
      onFinalResult: (text) {
        // Replace any in-progress dictation with the latest full result.
        _messageController.text = text;
        _messageController.selection = TextSelection.fromPosition(
          TextPosition(offset: text.length),
        );
      },
    );
    if (!mounted) return;
    setState(() => _listening = started);
    if (!started && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Voice input unavailable. First-time setup needs internet to '
            'download the speech model; check mic permission too.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final text = Theme.of(context).textTheme;
    final messages = ref.watch(chatMessagesProvider);
    final sending = ref.watch(sendMessageProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.assistant)),
      body: Column(
        children: [
          Expanded(
            child: messages.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('$error')),
              data: (items) => ListView.builder(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.screenMargin,
                  AppSpacing.md,
                  AppSpacing.screenMargin,
                  AppSpacing.md,
                ),
                itemCount: items.isEmpty ? 1 : items.length,
                itemBuilder: (context, index) {
                  if (items.isEmpty) {
                    return _MessageBubble(
                      message: l10n.offlineReady,
                      isUser: false,
                      text: text,
                    );
                  }
                  final item = items[index];
                  return _MessageBubble(
                    message: item.message,
                    isUser: item.role == 'user',
                    text: text,
                  );
                },
              ),
            ),
          ),
          if (sending) const LinearProgressIndicator(minHeight: 2),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenMargin,
                0,
                AppSpacing.screenMargin,
                AppSpacing.sm,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 48,
                    height: 56,
                    child: IconButton.filled(
                      onPressed: _toggleMic,
                      style: IconButton.styleFrom(
                        backgroundColor:
                            _listening ? AppColors.tangerine : AppColors.card,
                      ),
                      icon: Icon(
                        _listening
                            ? PhosphorIconsFill.microphone
                            : PhosphorIconsRegular.microphone,
                        color:
                            _listening ? Colors.white : AppColors.juniper,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      onSubmitted: (_) => _sendMessage(),
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        hintText:
                            _listening ? 'Listening…' : l10n.typeMessage,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: IconButton.filled(
                      onPressed: sending ? null : _sendMessage,
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.moss,
                      ),
                      icon: Icon(
                        PhosphorIconsRegular.paperPlaneTilt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.message,
    required this.isUser,
    required this.text,
  });

  final String message;
  final bool isUser;
  final TextTheme text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320),
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isUser ? AppColors.juniper : AppColors.card,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: isUser ? null : Border.all(color: AppColors.hairline),
        ),
        child: Text(
          message,
          style: text.bodyLarge?.copyWith(color: isUser ? Colors.white : null),
        ),
      ),
    );
  }
}
