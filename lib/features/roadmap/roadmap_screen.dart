import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/widgets/ks_card.dart';
import 'roadmap_provider.dart';

class RoadmapScreen extends ConsumerStatefulWidget {
  const RoadmapScreen({super.key});

  @override
  ConsumerState<RoadmapScreen> createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends ConsumerState<RoadmapScreen> {
  @override
  void initState() {
    super.initState();
    // Generate the plan from the farm profile if needed (no-op when current).
    Future<void>.microtask(
      () => ref.read(roadmapControllerProvider).ensurePlan(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final text = Theme.of(context).textTheme;
    final tasks = ref.watch(roadmapTasksProvider).valueOrNull ?? const [];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.roadmap)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.screenMargin,
          AppSpacing.md,
          AppSpacing.screenMargin,
          AppSpacing.xl,
        ),
        children: [
          Text(l10n.thisWeek, style: text.headlineSmall),
          const SizedBox(height: 4),
          Text(
            l10n.soilSeason,
            style: text.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.lg),
          if (tasks.isEmpty)
            KsCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(PhosphorIconsRegular.calendarBlank, color: AppColors.sage),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    l10n.roadmapEmpty,
                    style: text.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          else
            ...tasks.map(
              (task) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: KsCard(
                  onTap: () =>
                      ref.read(roadmapControllerProvider).setDone(task.id, !task.isDone),
                  color: task.isDone ? const Color(0xFFE8EFE3) : AppColors.card,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        task.isDone
                            ? PhosphorIconsFill.checkCircle
                            : PhosphorIconsRegular.circle,
                        color: task.isDone ? AppColors.moss : AppColors.sage,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.weekLabel,
                              style: text.labelMedium
                                  ?.copyWith(color: AppColors.juniper),
                            ),
                            Text(
                              task.title,
                              style: text.titleMedium?.copyWith(
                                decoration: task.isDone
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(task.details, style: text.bodyMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
