import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/models.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 2
    // TODO: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
// 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
// 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          final recipes = snapshot.data?.todayRecipes ?? [];
          // TODO: Replace this with TodayRecipeListView
          return ListView(scrollDirection: Axis.vertical, children: [
            TodayRecipeListView(recipes: recipes),
            const SizedBox(height: 16),
            // 9
            // TODO: Replace this with FriendPostListView
            Container(
              height: 400,
              color: Colors.green,
            ),
          ]);
        } else {
// 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
