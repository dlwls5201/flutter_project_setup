import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_setup/data/model/mood_model.dart';

import '../repo/mood_repo.dart';

class MoodViewModel extends AsyncNotifier<List<MoodModel>> {
  List<MoodModel> _list = [];

  late final MoodRepository _moodRepository;

  @override
  FutureOr<List<MoodModel>> build() {
    _moodRepository = ref.read(moodRepo);
    return _list;
  }

  Future<void> fetchMoods() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    final moods = await _moodRepository.getMoods();
    List<MoodModel> items = [];
    for (var mood in moods) {
      items.add(
        MoodModel.fromJson(mood),
      );
    }
    //people.sort((a, b) => a.name.compareTo(b.name));
    items.sort((a, b) => b.createdAtMillisecond.compareTo(a.createdAtMillisecond));
    _list = items;
    state = AsyncValue.data(_list);
  }
}

final moodViewModel = AsyncNotifierProvider<MoodViewModel, List<MoodModel>>(() => MoodViewModel());
