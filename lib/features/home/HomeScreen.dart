import 'package:flutter/material.dart';
import 'package:project_setup/features/home/widgets/mood_widgets.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../data/model/mood_model.dart';

class HomeScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gaps.v48,
            const Text(
              "🔥MOOD🔥",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.bold,
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
