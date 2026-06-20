import 'package:flutter/material.dart';
import 'package:zomato/core/theme/app_colours.dart';
enum HomeTab{home, search,cart,orders,profile}
class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
    this.cartItemCount = 0,
  });

  final HomeTab currentTab;
  final ValueChanged<HomeTab> onTabSelected;
  final int cartItemCount;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentTab.index,
      onDestinationSelected: (i) => onTabSelected(HomeTab.values[i]),
      indicatorColor: AppColors.primary.withValues(alpha: 0.12),
      destinations: [
        _dest(Icons.home_outlined, Icons.home, 'Home', HomeTab.home),
        _dest(Icons.search, Icons.search, 'Search', HomeTab.search),
        NavigationDestination(
          icon: Badge(
            isLabelVisible: cartItemCount > 0,
            label: Text('$cartItemCount'),
            child: const Icon(Icons.shopping_cart_outlined),
          ),
          selectedIcon: const Icon(Icons.shopping_cart, color: AppColors.primary),
          label: 'Cart',
        ),
        _dest(Icons.receipt_long_outlined, Icons.receipt_long, 'Orders', HomeTab.orders),
        _dest(Icons.person_outline, Icons.person, 'Profile', HomeTab.profile),
      ],
    );
  }

  NavigationDestination _dest(
    IconData icon,
    IconData selectedIcon,
    String label,
    HomeTab tab,
  ) {
    final selected = currentTab == tab;
    return NavigationDestination(
      icon: Icon(icon, color: selected ? AppColors.primary : AppColors.navInactive),
      selectedIcon: Icon(selectedIcon, color: AppColors.primary),
      label: label,
    );
  }
}