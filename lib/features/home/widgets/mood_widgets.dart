import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_setup/features/home/repo/mood_repo.dart';
import 'package:project_setup/features/home/view_models/mood_view_mode.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../data/model/mood_model.dart';
import '../../../utils.dart';
import '../../authentication/repos/authentication_repo.dart';

class ModeWidget extends ConsumerWidget {
  const ModeWidget({
    super.key,
    required this.model,
  });

  final MoodModel model;

  String _getDateCompareToNow(int millisecond) {
    final difference = DateTime.now().millisecondsSinceEpoch - millisecond;
    const oneMinute = 60000;
    final remainMinute = difference ~/ oneMinute;
    return "$remainMinute minutes ago";
  }

  void _onMoodLongPress(BuildContext context, WidgetRef ref) async {
    if (model.creatorUid != ref.read(authRepo).user?.uid) {
      Fluttertoast.showToast(
        msg: "❌ This is not your mood",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete 🤔"),
        content: const Text("do yo wanna delete your mood?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(moodRepo).deleteMood(model);
              await ref.read(moodViewModel.notifier).fetchMoods();
              Navigator.of(context).pop();
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.size24,
      ),
      child: GestureDetector(
        onLongPress: () => _onMoodLongPress(context, ref),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                border: Border.all(
                  color: isDarkMode(context) ? Colors.white : Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                  Sizes.size16,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: Sizes.size8, horizontal: Sizes.size16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mood:${model.icon}",
                      style: const TextStyle(
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gaps.v2,
                    Text(
                      model.contents,
                      style: const TextStyle(
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gaps.v6,
            Text(
              _getDateCompareToNow(model.createdAtMillisecond),
              style: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gaps.v36,
          ],
        ),
      ),
    );
  }
}
