import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_setup/features/authentication/view_models/login_view_model.dart';
import 'package:project_setup/features/home/widgets/mood_widgets.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../data/model/mood_model.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final items = [
    MoodModel(
      icon: "🤔",
      contents: "hello my name is peter",
      createdAtMillisecond: 1720508425776,
    ),
    MoodModel(
      icon: "😤",
      contents: "my feeling is not good",
      createdAtMillisecond: 1720508425776,
    ),
    MoodModel(
      icon: "😡",
      contents: "I am angry",
      createdAtMillisecond: 1720508425776,
    ),
    MoodModel(
      icon: "🤗",
      contents: "Today is so nice",
      createdAtMillisecond: 1720508425776,
    )
  ];

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
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final model = items[index];
                  return ModeWidget(model: model);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
