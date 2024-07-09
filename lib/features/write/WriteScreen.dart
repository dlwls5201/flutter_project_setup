import 'package:flutter/cupertino.dart';

import '../../constants/sizes.dart';

class WriteScreen extends StatelessWidget {
  const WriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Write",
        style: TextStyle(
          fontSize: Sizes.size20,
        ),
      ),
    );
  }
}
