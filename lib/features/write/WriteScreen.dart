import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_setup/data/model/mood_model.dart';
import 'package:project_setup/features/authentication/repos/authentication_repo.dart';
import 'package:project_setup/features/home/repo/mood_repo.dart';
import 'package:project_setup/features/home/view_models/mood_view_mode.dart';
import 'package:project_setup/features/widgets/mood_button_widgets.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../utils.dart';

class WriteScreen extends ConsumerStatefulWidget {
  WriteScreen({super.key});

  @override
  WriteScreenState createState() => WriteScreenState();
}

class WriteScreenState extends ConsumerState<WriteScreen> {
  final TextEditingController _contentController = TextEditingController();

  final moods = [
    '🤗',
    '🥳',
    '😔',
    '🥺',
    '😭',
    '😡',
    '😱',
    '🤮',
  ];

  late var _selectedMood = moods.first;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  void _onPost() async {
    final contents = _contentController.text;
    final userId = ref.read(authRepo).user!.uid;
    await ref.read(moodRepo).saveMood(
          MoodModel(
            icon: _selectedMood,
            contents: contents,
            creatorUid: userId,
            createdAtMillisecond: DateTime.now().millisecondsSinceEpoch,
          ),
        );

    await ref.read(moodViewModel.notifier).fetchMoods();
    context.go("/home");
  }

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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "How do you feel?",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.h12,
                      ref.watch(moodViewModel).when(
                            data: (data) => Container(),
                            error: (error, stackTrace) => Text("$error"),
                            loading: () => const SizedBox(
                              width: Sizes.size16,
                              height: Sizes.size16,
                              child: CircularProgressIndicator(),
                            ),
                          )
                    ],
                  ),
                  Gaps.v12,
                  TextField(
                    maxLines: 4,
                    textInputAction: TextInputAction.newline,
                    controller: _contentController,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      hintText: "Write it down here!",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: Sizes.size2,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: Sizes.size2,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v32,
                  const Text(
                    "What's your mood?",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (final mood in moods)
                        GestureDetector(
                          onTap: () => {
                            setState(() {
                              _selectedMood = mood;
                            })
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: _selectedMood == mood
                                    ? Theme.of(context).primaryColor
                                    : (isDarkMode(context) ? Colors.white : Colors.black),
                                width: _selectedMood == mood ? Sizes.size2 : Sizes.size1,
                              ),
                              borderRadius: BorderRadius.circular(
                                Sizes.size8,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size8,
                                horizontal: Sizes.size6,
                              ),
                              child: Text(mood),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Gaps.v32,
                  Align(
                    alignment: Alignment.center,
                    child: MoodButtonWidget(
                      buttonText: "POST",
                      onTap: _onPost,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
