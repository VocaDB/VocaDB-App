import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/error_message_widget.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/home/presentation/main_screen/main_screen_controller.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_events_list/release_events_horizontal_list_view.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class RecentEventsSection extends StatelessWidget {
  const RecentEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Happening now',
      child: Consumer(builder: ((context, ref, child) {
        final value = ref.watch(mainScreenRecentEventsProvider);

        if (value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return value.when(
          data: (data) {
            return ReleaseEventsHorizontalListView(
              releaseEvents: data,
              onSelect: context.goReleaseEventDetail,
            );
          },
          error: (e, st) => Center(
            child: ErrorMessageWidget(e.toString()),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      })),
    );
  }
}
