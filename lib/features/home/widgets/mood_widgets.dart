import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../data/model/mood_model.dart';
import '../../../utils.dart';

class ModeWidget extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.size24,
      ),
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
              padding: const EdgeInsets.symmetric(vertical: Sizes.size8, horizontal: Sizes.size16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mode:${model.icon}",
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
    );
  }
}
