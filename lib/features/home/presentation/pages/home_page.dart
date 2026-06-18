import 'package:flutter/material.dart';
import 'package:zomato/core/theme/app_colours.dart';
import 'package:zomato/core/theme/app_sizes.dart';
import 'package:zomato/core/theme/app_text_style.dart';
import 'package:zomato/core/widgets/category_tile.dart';
import 'package:zomato/core/widgets/home_bottom_nav.dart';
import 'package:zomato/core/widgets/home_header.dart';
import 'package:zomato/core/widgets/promo_banner.dart';
import 'package:zomato/core/widgets/restaurant_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeTab _currentTab = HomeTab.home;
  final _searchController = TextEditingController();

  static const _categories = [
    ('Pizza', '🍕', AppColors.categoryPizza),
    ('Burgers', '🍔', AppColors.categoryBurger),
    ('Sushi', '🍣', AppColors.categorySushi),
    ('Noodles', '🍜', AppColors.categoryNoodles),
  ];

  // Replace with API data from RestaurantsBloc later
  static const _restaurants = [
    (
      name: 'Pizza Palace',
      cuisine: 'Pizza, Pasta, Italian',
      rating: 4.3,
      time: '25-30 min',
      offer: '20% off',
      emoji: '🍕',
      bg: AppColors.categoryPizza,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: CustomScrollView(
        slivers: [
      
          SliverToBoxAdapter(
            child: HomeHeader(
              location: 'Koramangala, BLR',
              searchController: _searchController,
              onLocationTap: () {},
              onSearchChanged: (q) {
                // dispatch RestaurantsSearchChanged to BLoC
              },
              onNotificationTap: () {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSizes.lg)),
          const SliverToBoxAdapter(child: PromoBanner()),
          const SliverToBoxAdapter(child: SizedBox(height: AppSizes.xl)),

          // Categories
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
              child: Text("What's on your mind?", style: AppTextStyles.sectionTitle),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(AppSizes.lg),
                itemCount: _categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: AppSizes.lg),
                itemBuilder: (_, i) {
                  final (label, emoji, color) = _categories[i];
                  return CategoryTile(
                    label: label,
                    emoji: emoji,
                    backgroundColor: color,
                    onTap: () {},
                  );
                },
              ),
            ),
          ),

          // Top picks
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(AppSizes.lg, 0, AppSizes.lg, AppSizes.sm),
              child: Text('Top picks for you', style: AppTextStyles.sectionTitle),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) {
                final r = _restaurants[i];
                return RestaurantCard(
                  name: r.name,
                  cuisine: r.cuisine,
                  rating: r.rating,
                  deliveryTime: r.time,
                  offerText: r.offer,
                  imageEmoji: r.emoji,
                  imageBgColor: r.bg,
                  onTap: () {
                    // context.push('/restaurants/$id');
                  },
                );
              },
              childCount: _restaurants.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSizes.xxl)),
      ]),
      bottomNavigationBar: HomeBottomNav(
        currentTab: _currentTab,
        cartItemCount: 2,
        onTabSelected: (tab) => setState(() => _currentTab = tab),
      ),
    );
  }
}