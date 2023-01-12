import 'package:flutter/material.dart';

import '../models/models.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

class TodayRecipeListView extends StatelessWidget {
  // 2
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recipes of the Day  ',
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          // 7
          Container(
            height: 400,
            // TODO: Add ListView Here
            color: Colors.transparent,
// 2
            child: ListView.separated(
// 3
              scrollDirection: Axis.horizontal,
// 4
              itemCount: recipes.length,
// 5
              itemBuilder: (context, index) {
// 6
                final recipe = recipes[index];
                return buildCard(recipe);
              },
// 7
              separatorBuilder: (context, index) {
// 8
                return const SizedBox(width: 16);
              },
            ),
          ),
        ],
      ),
    );
  }

// TODO: Add buildCard() widget here
  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
