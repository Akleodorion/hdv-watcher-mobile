import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hdv_watcher/core/providers/occupied/state/occupied_state.dart';
import 'package:hdv_watcher/core/widgets/buttons/cta_button/functions/state_watcher.dart';

class CtaButton extends ConsumerWidget {
  const CtaButton({super.key, required this.onTap, required this.title});

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: stateWatcher(ref),
        builder: (context, snapshot) {
          final isLoading = snapshot.data is Loading;
          return ElevatedButton(
            onPressed: isLoading ? null : onTap,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
            ),
            child: isLoading
                ? const CircularProgressIndicator(
                    strokeWidth: 2,
                  )
                : Text(title),
          );
        });
  }
}
