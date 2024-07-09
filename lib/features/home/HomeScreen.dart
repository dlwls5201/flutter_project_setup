import 'package:flutter/cupertino.dart';

import '../../constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Home",
        style: TextStyle(
          fontSize: Sizes.size20,
        ),
      ),
    );
  }
}
