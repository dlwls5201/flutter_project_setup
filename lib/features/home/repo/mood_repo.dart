import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_setup/data/model/mood_model.dart';

class MoodRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveMood(MoodModel mood) async {
    await _db.collection("moods").doc(mood.getDocId()).set(mood.toJson());
  }

  Future<void> deleteMood(MoodModel mood) async {
    await _db.collection("moods").doc(mood.getDocId()).delete();
  }

  Future<List<Map<String, dynamic>>> getMoods() async {
    final querySnapshot = await _db.collection("moods").get();
    final documents = querySnapshot.docs;
    List<Map<String, dynamic>> items = [];
    for (var document in documents) {
      final data = document.data();
      items.add(data);
    }
    return items;
  }
}

final moodRepo = Provider((ref) => MoodRepository());
