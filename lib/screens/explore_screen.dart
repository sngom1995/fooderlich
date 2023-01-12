import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/models.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ScrollController _controller;

  // 1
  final mockService = MockFooderlichService();

  void _scrollListener() {
    // 1
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print('i am at the bottom!');
      print('i am at the bottom!');
    }
// 2
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print('i am at the top!');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

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
          return ListView(
            scrollDirection: Axis.vertical,
            controller: _controller,
            children: [
              TodayRecipeListView(recipes: recipes),
              const SizedBox(height: 16),
              // 9
              // TODO: Replace this with FriendPostListView
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
            ],
          );
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
