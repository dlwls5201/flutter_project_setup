import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_setup/features/authentication/view_models/login_view_model.dart';
import 'package:project_setup/features/home/view_models/mood_view_mode.dart';
import 'package:project_setup/features/home/widgets/mood_widgets.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // initState에서는 Provider 상태를 직접 수정하지 않습니다.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _initializeAsync();
    });
  }

  Future<void> _initializeAsync() async {
    if (mounted) {
      await ref.read(moodViewModel.notifier).fetchMoods();
    }
  }

  void _onLogoutLongPress(BuildContext context, WidgetRef ref) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Log out 👋"),
        content: const Text("Are you sure?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(loginViewModel.notifier).logout(context);
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gaps.v48,
            GestureDetector(
              onLongPress: () => _onLogoutLongPress(context, ref),
              child: const Text(
                "🔥MOOD🔥",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Gaps.v48,
            Expanded(
              child: ref.watch(moodViewModel).when(
                    data: (moods) {
                      return ListView.builder(
                        itemCount: moods.length,
                        itemBuilder: (context, index) {
                          final model = moods[index];
                          return ModeWidget(model: model);
                        },
                      );
                    },
                    error: (error, stackTrace) => Center(
                      child: Text(
                        'Could not load moods: $error',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
