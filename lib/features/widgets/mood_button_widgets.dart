import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../utils.dart';

class MoodButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onTap;

  const MoodButtonWidget({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
            color: isDarkMode(context) ? Colors.white : Colors.black,
            width: Sizes.size2,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size16,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
            vertical: Sizes.size8,
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size16,
            ),
          ),
        ),
      ),
    );
  }
}